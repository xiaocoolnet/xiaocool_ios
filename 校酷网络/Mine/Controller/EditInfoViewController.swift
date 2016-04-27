//
//  EditInfoViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class EditInfoViewController: UIViewController{

    let user = NSUserDefaults.standardUserDefaults()
//    昵称
    @IBOutlet weak var niceNameTextField: UITextField!

//    年龄
    @IBOutlet weak var ageTextField: UITextField!
//    地点
    @IBOutlet weak var cityTextField: UITextField!
//    性别
    @IBOutlet weak var sexBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "编辑资料"
        //保存
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style:.Plain, target: self, action: #selector(EditInfoViewController.Right))
//加载信息
        self.loadInfo()
//        设置性别
        self.sexBtn.addTarget(self, action: #selector(EditInfoViewController.chooseSex), forControlEvents: .TouchUpInside)
    }
//    设置性别
    func chooseSex(){
        let alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "男", style: .Default, handler: { (UIAlertAction) -> Void in
            self.sexBtn.setTitle("男", forState: .Normal)
        }))
        alert.addAction(UIAlertAction(title: "女", style: .Default, handler: { (UIAlertAction) -> Void in
            self.sexBtn.setTitle("女", forState: .Normal)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
//        加载信息
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
                    self.niceNameTextField.text = userInfoModel.data?.user_nicename
                    //                    用户信息
                    var sex = userInfoModel.data?.sex
                    if sex == "0"{
                        sex = "男"
                    }else{
                        sex = "女"
                    }
                    self.sexBtn.setTitle(sex, forState: .Normal)
                    self.ageTextField.text = userInfoModel.data?.age
                    self.cityTextField.text = userInfoModel.data?.city
                }
                
            }
        }
    }
//    保存用户信息
    func Right(){
        let userId = user.valueForKey("userid") as! String
        let url = apiUrl+"savepersonalinfo"
        var sex = String()
        if self.sexBtn.currentTitle! == "男" {
            sex = "0"
        }else{
             sex = "1"
        }
        let param = [
            "userid":userId,
            "nicename":self.niceNameTextField.text!,
            "sex":sex,
            "age":self.ageTextField.text!,
            "city":self.cityTextField.text!,
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
                let httpresult = Httpresult(JSONDecoder(json!))
                print("状态是")
                print(httpresult.status)
                print(httpresult)
                if httpresult.status == "error" {
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = httpresult.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if httpresult.status == "success" {
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "保存成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true,afterDelay: 1)
                    
//                    重新加载一下信息
                    self.loadInfo()
                }
                
            }
        }
    }
    //    收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
