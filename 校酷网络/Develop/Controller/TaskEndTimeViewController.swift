//
//  TaskEndTimeViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TaskEndTimeViewController: UIViewController {
//输入截止时间
    @IBOutlet weak var endTimeTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "截止时间"
    }
//    完成
    @IBAction func finishedBtn(sender: AnyObject) {
        if(endTimeTextfield.text!.isEmpty){
            let alert = UIAlertController(title: "提示", message: "截止时间不能为空", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
