//
//  CodeViewController.swift
//  校酷网络
//
//  Created by zhang on 16/4/6.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire

class CodeViewController: UIViewController {
    
//电话号码
    @IBOutlet weak var phoneLbl: UILabel!
//    验证码
    @IBOutlet weak var numTextField: UITextField!
//    倒计时
    @IBOutlet weak var timeLbl: UILabel!
//    再次发送
    @IBOutlet weak var secondSendBtn: UIButton!
    
    var timeNomal:NSTimer!
    var timeNow:NSTimer!
    var count:Int = 60
    var phoneNum:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "填写验证码"
        //        隐藏倒计时
        timeLbl.hidden = true
        //设置提示板号码
        phoneLbl.text = "+86-\(phoneNum!)"
    }
    @IBAction func secondSendBtn(sender: AnyObject) {
        timeLbl.hidden = false
        secondSendBtn.hidden = true
        //        开启倒计时
        self.timeDown()
        self.sendMobileCode()
    }

    @IBAction func nextBtn(sender: AnyObject) {
        if (numTextField.text!.isEmpty){
            let alert = UIAlertController(title: "提示", message: "验证码不能为空", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            //        跳转界面
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SetPasswordView")
            vc.setValue(phoneNum, forKey: "phoneNum")
            vc.setValue(self.numTextField.text, forKey: "code")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    //    倒计时开始
    func timeDown(){
        let time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(CodeViewController.updateTime), userInfo: nil, repeats: true)
        timeNow = time1
    }
    //    展现再次发送的按钮
    func showSecondSendBtn(){
        timeLbl.hidden = true
        secondSendBtn.hidden = false
        secondSendBtn.enabled = true
    }
    //    更新时间
    func  updateTime(){
        count -= 1
        if(count<=0){
            count = 60
            self.showSecondSendBtn()
            timeNow.invalidate()
        }
        timeLbl.text = "\(count)S"
    }
    
    
    //    收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    //    再次发送验证码
    func sendMobileCode(){
        let url = apiUrl + "SendMobileCode"
        let param = [
            "phone":phoneNum!
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
