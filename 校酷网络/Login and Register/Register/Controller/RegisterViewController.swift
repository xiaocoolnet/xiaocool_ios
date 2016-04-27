//
//  RegisterViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class RegisterViewController: UIViewController {
//电话号码
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//      取消隐藏导航栏
        self.navigationController?.navigationBar.hidden = false
        
    }
//    下一步
    @IBAction func nextBtn(sender: AnyObject) {
        let phoneNum:String =  (phoneTextField.text)!
//        判断手机号码输入是否正确或者是否输入
        if (phoneTextField.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "手机号不能为空"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true,afterDelay: 2)
         }else if (!isTelNumber(phoneNum)){//判断输入是否是电话号码
            let alert = UIAlertController(title: "手机号输入错误", message: "请重新输入", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "取消", style: .Cancel, handler:nil))
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
//            接收验证码
            self.sendMobileCode()
            //        跳转界面
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WriteView")
            vc.setValue(self.phoneTextField.text, forKey: "phoneNum")
            self.navigationController?.pushViewController(vc, animated: true)
            
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
//    收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
//    接收验证码
    func sendMobileCode(){
        let url = apiUrl + "SendMobileCode"
        let param = [
            "phone":self.phoneTextField.text!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
            }
        }
    }
}
