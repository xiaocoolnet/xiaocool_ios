//
//  SetPwViewController.swift
//  校酷网络
//
//  Created by zhang on 16/4/6.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class SetPwViewController: UIViewController {
//    第一次输入密码
    @IBOutlet weak var setpwTextField: UITextField!
//    再次输入密码
    @IBOutlet weak var setTwoTextField: UITextField!
    var phoneNum:String?
    var code:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "设置密码"
    }
//    完成
    @IBAction func finishedBtn(sender: AnyObject) {
        //        判断是否为空
        if(setpwTextField.text!.isEmpty||setTwoTextField.text!.isEmpty){
            let alert = UIAlertController(title: "提示", message: "密码不能为空", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else if(setpwTextField.text != setTwoTextField.text){
            let alert = UIAlertController(title: "提示", message: "两次密码不一样", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            let url = apiUrl + "forgetpwd"
            
            let param = [
                "phone":phoneNum!,
                "password":self.setpwTextField.text!,
                "code":code!,
                "token":"xiaocoolself"
            ]
            print(url)
            Alamofire.request(.GET, url, parameters: param ).response { request, response, json, error in
                if(error != nil){
                }
                else {
                    print("request是")
                    print(request!)
                    print("====================")
                    let httpresult = Httpresult(JSONDecoder(json!))
                    print(JSONDecoder(json!))
                    print("状态是")
                    print(httpresult.data)
                    if(httpresult.status == "error"){
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text;
                        hud.labelText = httpresult.errorData
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 3)
                    }
                    if(httpresult.status == "success"){
                        //        跳转界面
                        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("FirstView")
                        vc.setValue(self.phoneNum!, forKey: "phoneNum")
                        vc.setValue(self.setpwTextField.text!, forKey: "password")
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    }
                }
            }
        }
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
