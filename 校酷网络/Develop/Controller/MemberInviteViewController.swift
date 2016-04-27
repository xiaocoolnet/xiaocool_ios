//
//  MemberInviteViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MemberInviteViewController: UIViewController {

//    成员账号
    @IBOutlet weak var memberNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "成员邀请"
    }
//邀请
    @IBAction func inviteBtn(sender: AnyObject) {
        if (memberNumberTextField.text!.isEmpty){
            let alert = UIAlertController(title: "提示", message: "成员账号不能为空", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "邀请成功", message: "请等待对方接受，接下来你可以选择", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "完成确定", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "返回继续邀请", style: .Default, handler: { (UIAlertAction) -> Void in
                //    继续邀请之后输入框清空
                    self.memberNumberTextField.text = ""
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    //点击空白处，回收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
