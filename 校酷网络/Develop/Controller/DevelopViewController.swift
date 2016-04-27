//
//  DevelopViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import YYWebImage
import MBProgressHUD
import XWSwiftRefresh

class DevelopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let table = UITableView()
    let user = NSUserDefaults.standardUserDefaults()
    var projectSource = MyProjectList()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createTable()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(DevelopViewController.right))
        self.DropDownUpdate()
    }
//    创建新项目
    func right(){
        let vc = NewProjectViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //    开始刷新
    func DropDownUpdate(){
        self.table.headerView = XWRefreshNormalHeader(target: self, action: #selector(MyProjectViewController.loadData))
        self.table.reloadData()
        self.table.headerView?.beginRefreshing()
    }
    //    加载数据
    func loadData() {
        let userid = user.valueForKey("userid") as? String
        let url = projectUrl + "getprojectlist"
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
                print("====================")
                let http = Http(JSONDecoder(json!))
                print("状态是")
                print(http.status)
                if(http.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(http.status == "success"){
                    self.projectSource = MyProjectList(http.data!)
                    self.table.reloadData()
                    self.table.headerView?.endRefreshing()
                }
            }
        }
    }
    //    创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-39)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 120
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
        //        注册cell
        table.registerNib(UINib.init(nibName: "DevelopTableViewCell", bundle: nil), forCellReuseIdentifier: "DevelopID")
        
    }
    //    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.projectSource.count
    }
    //    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DevelopID", forIndexPath: indexPath) as! DevelopTableViewCell
        cell.selectionStyle = .None
        let myProjectinfo = self.projectSource.probjectlist[indexPath.section]
        cell.nameLbl.text = myProjectinfo.item_title
        let imgUrl = imageUrl+(myProjectinfo.item_poster)!
        let avatarUrl = NSURL(string: imgUrl)
        cell.headImageView.yy_setImageWithURL(avatarUrl, placeholder: UIImage(named: "a.png"))
        return cell
    }
    //    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let myProjectinfo = self.projectSource.probjectlist[indexPath.section]
        let vc:UIViewController = TaskViewController()
        vc.setValue(myProjectinfo.item_id, forKey: "itemId")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
