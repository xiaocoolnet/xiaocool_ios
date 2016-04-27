//
//  ProjectInfoViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ProjectInfoViewController: UIViewController {

//    项目简介
    @IBOutlet weak var infoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "项目简介"
    }
//完成
    @IBAction func finishedBtn(sender: AnyObject) {
        if (infoTextView.text!.isEmpty){
            let alert = UIAlertController(title: "提示", message: "项目简介不能为空", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    //点击空白处，回收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
