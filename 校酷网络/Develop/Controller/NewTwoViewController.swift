//
//  NewTwoViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class NewTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "新建项目"
    }
//项目名称
    @IBAction func nameBtn(sender: AnyObject) {
        let vc = ProjectNameViewController()
        vc.nameString = "项目名称"
        self.navigationController?.pushViewController(vc, animated: true)
    }
//项目简介
    @IBAction func InfoBtn(sender: AnyObject) {
        let vc = ProjectInfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//项目成员邀请
    @IBAction func inviteMemberBtn(sender: AnyObject) {
        let vc = MemberInviteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//提交    
    @IBAction func submitBtn(sender: AnyObject) {
        let  alert = UIAlertController(title: "提示", message: "提交成功", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
