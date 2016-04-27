//
//  LoginViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class LoginViewController: UIViewController,UITextFieldDelegate {
//    用户输入框
    @IBOutlet weak var userTextField: UITextField!
//    密码输入框
    @IBOutlet weak var passwordTextField: UITextField!
//    logo的上边距
    @IBOutlet weak var logoTop: NSLayoutConstraint!
//    输入框的上边距
    @IBOutlet weak var userTFTop: NSLayoutConstraint!
    
    var phoneNum:String?
    var password:String?
    
    override func viewWillAppear(animated: Bool) {
//                隐藏导航栏
        self.navigationController?.navigationBar.hidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        注册键盘
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
//        设置代理
        userTextField.delegate = self
        passwordTextField.delegate = self
//        如果是从注册界面过来的直接赋值电话号码和密码
        self.userTextField.text = phoneNum
        self.passwordTextField.text = password
    }
//    点击键盘的return时
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
//    键盘消失的通知方法
    func keyboardWillHideNotification(notification:NSNotification){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.logoTop.constant = 64
            self.userTFTop.constant = 220
            self.view.layoutIfNeeded()
        }
    }
//    键盘出现的通知方法
    func keyboardWillShowNotification(notification:NSNotification){
           UIView.animateWithDuration(0.3) { () -> Void in
            self.logoTop.constant = 20
            self.userTFTop.constant = 120
            self.view.layoutIfNeeded()
        }
    }
//    点击self.view时
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
//    登录
    @IBAction func loginBtn(sender: AnyObject) {
        let numPhone:String = (userTextField.text)!
//        如果用户名为空
        if (userTextField.text!.isEmpty) {
            let hud = MBProgressHUD.showHUDAddedTo(self.view,animated:true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入账号"
//            边距
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true,afterDelay: 1)
            return
        }else if !isTelNumber(numPhone) {
            let hud = MBProgressHUD.showHUDAddedTo(self.view,animated:true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入正确的电话号码"
            //            边距
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true,afterDelay: 1)
            return
        }
//        如果密码为空
        if(passwordTextField.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true,afterDelay: 1)
            return
        }
        let url = apiUrl+"applogin"
        let param = [
            "phone":self.userTextField.text!,
            "password":self.passwordTextField.text!,
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
                   print("登录成功")
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "登录成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true,afterDelay: 1)
//                    存储用户信息
                    let userid = NSUserDefaults.standardUserDefaults()
                    userid.setValue(httpresult.data?.id, forKey: "userid")
                   
                    
                    let user = NSUserDefaults.standardUserDefaults()
                    user.setValue(self.userTextField.text, forKey: "user")
                    let password = NSUserDefaults.standardUserDefaults()
                    password.setValue(self.passwordTextField.text, forKey: "password")
                
//                  同步一下
                    user.synchronize()
//                  跳到主界面
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
                    self.presentViewController(vc, animated: true, completion: nil)
                }
                
                }
        }
        
    }
//    判断是否为电话号码
    func isTelNumber(num:NSString)->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(num) == true)
            || (regextestcm.evaluateWithObject(num)  == true)
            || (regextestct.evaluateWithObject(num) == true)
            || (regextestcu.evaluateWithObject(num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }

}
