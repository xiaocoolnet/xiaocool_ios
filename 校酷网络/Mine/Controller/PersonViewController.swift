//
//  PersonViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class PersonViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    let table = UITableView()
    let backImageView = UIImageView()//背景图
    let headImageView = UIImageView()//头像
     let nameLbl = UILabel()//名称
    let infoLbl = UILabel()//个人信息
    let user = NSUserDefaults.standardUserDefaults()
    override func viewWillAppear(animated: Bool) {
        self.loadInfo()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "个人中心"
//        创建表
        self.createTable()
        

    }
    
//    加载信息
    func loadInfo(){
        let userid = user.valueForKey("userid") as? String
        let url = apiUrl+"getuserinfo"
        let param = [
            "userid":userid!,
            "token":"xiaocoolself"
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
                let userInfoModel = UserInfoList(JSONDecoder(json!))
                print("状态是")
                print(userInfoModel.status)
                print(userInfoModel)
                if userInfoModel.status == "error" {
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = userInfoModel.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if userInfoModel.status == "success" {
//                    名称
                    self.nameLbl.text = userInfoModel.data?.user_nicename
//                    用户信息
                    var sex = userInfoModel.data?.sex
                    if sex == "0"{
                        sex = "男"
                    }else{
                        sex = "女"
                    }
                    let age = userInfoModel.data?.age
                    let city = userInfoModel.data?.city
                    self.infoLbl.text = "\(sex!)  \(age!)  \(city!)"
//                    头像
                    if userInfoModel.data?.avatar != nil {
                        let imgUrl = imageUrl + (userInfoModel.data?.avatar)!
                        if imgUrl != "" {
                            let url = NSURL(string:imgUrl)
                            //            //从网络获取数据流
                            let data = NSData(contentsOfURL: url!)
                            //            //通过数据流初始化图片
                            let newImage = UIImage(data: data!)
                            self.headImageView.image = newImage
                        }
                    }
                    
                }
                
            }
        }
    }
//创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
//        创建表头
        let headView = UIView()
        headView.frame = CGRectMake(0, 0, WIDTH, 170)
        table.tableHeaderView = headView
//        背景图
        backImageView.frame = CGRectMake(0, 0, WIDTH, 170)
        backImageView.image = UIImage(named: "b.png")
        backImageView.alpha = 0.5
        headView.addSubview(backImageView)
//        头像
        headImageView.frame = CGRectMake(WIDTH/2-50, 2, 100, 100)
        headImageView.image = UIImage(named: "b.png")
        headImageView.cornerRadius = 50
        headView.addSubview(headImageView)
//        修改头像
        let updateImgBtn = UIButton()
        updateImgBtn.frame = CGRectMake(WIDTH/2-50, 2,  100, 100)
        updateImgBtn.addTarget(self, action: #selector(PersonViewController.addPicture), forControlEvents: .TouchUpInside)
        headView.addSubview(updateImgBtn)
//        名称
        nameLbl.frame = CGRectMake(20, 110, WIDTH-40, 20)
        nameLbl.textAlignment = .Center
        headView.addSubview(nameLbl)
//        个人信息
        infoLbl.frame = CGRectMake(10, 140, WIDTH-20, 20)
        infoLbl.textAlignment = .Center
        headView.addSubview(infoLbl)
//        创建表尾
        let footView = UIView()
        footView.frame = CGRectMake(0, 0, WIDTH, 50)
        table.tableFooterView = footView
//        退出按钮
        let quitBtn = UIButton()
        quitBtn.frame = CGRectMake(0, 0, WIDTH, 50)
        quitBtn.setTitle("退出帐号", forState: .Normal)
        quitBtn.backgroundColor = UIColor(red: 0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1)
        quitBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        quitBtn.addTarget(self, action: #selector(PersonViewController.quitBtn), forControlEvents: .TouchUpInside)
        footView.addSubview(quitBtn)
        
//        注册Cell
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
//    有几行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
//    行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
//    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
//        分割线
        let lineView = UIView()
        lineView.frame = CGRectMake(0, 50, WIDTH, 1)
        lineView.backgroundColor = UIColor.lightGrayColor()
        cell.addSubview(lineView)
        
        if (indexPath.row == 0){
            cell.textLabel?.text = "编辑个人资料"
        }
        if (indexPath.row == 1){
            cell.textLabel?.text = "我的项目"
        }
        if (indexPath.row == 2){
            cell.textLabel?.text = "我的课程"
        }
        if (indexPath.row == 3){
            cell.textLabel?.text = "我收到的消息"
        }
        
        return cell
    }
//    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            let vc = EditInfoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.row == 1){
            let vc = MyProjectViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.row == 2){
            let vc = ClassViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.row == 3){
            let vc = ReceivemessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
//退出帐号
    func    quitBtn(){
        //        隐藏标签栏
        self.navigationController?.tabBarController?.tabBar.hidden = true
        self.navigationController?.tabBarController?.tabBar.translucent = true
//        清除登录信息
        NSUserDefaults.standardUserDefaults().removeObjectForKey("userid")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("password")
        NSUserDefaults.standardUserDefaults().synchronize()
        //        跳转界面
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("FirstView")
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    添加图片
    func addPicture(){
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var image = UIImage()
        image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        self.headImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.saveImage(image, newSize: CGSize(width: 256, height: 256), percent: 0.5, imageName: "currentImage.png")

    }
    //保存图片至沙盒
    func saveImage(currentImage: UIImage, newSize: CGSize, percent: CGFloat, imageName: String){
        //压缩图片尺寸
        UIGraphicsBeginImageContext(newSize)
        currentImage.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //高保真压缩图片质量
        //UIImageJPEGRepresentation此方法可将图片压缩，但是图片质量基本不变，第二个参数即图片质量参数。
        let imageData:NSData = UIImagePNGRepresentation(newImage)!
        //        上传修改
        self.updateHeadImg(imageData)
    }   
    //    修改头像
    func updateHeadImg(file:NSData){
        let userid = user.valueForKey("userid") as? String
        let RanNumber = String(arc4random_uniform(1000) + 1000)

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            ConnectModel.uploadWithImageName("2\(userid!)\(RanNumber)", imageData:file, URL: "uploadavatar", finish: { (data) -> Void in
                    print("返回值")
                    print(data)
                    let httpresult = Httpresult(JSONDecoder(data!))
                    print("状态是")
                    print(httpresult.status)
                    if(httpresult.status == "error"){
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text
                        hud.labelText = httpresult.errorData
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 1)
                    }
                    if(httpresult.status == "success"){
                        print("Success")
                    }
            })}
    }
}
