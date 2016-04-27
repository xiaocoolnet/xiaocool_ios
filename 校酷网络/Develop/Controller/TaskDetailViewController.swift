
//
//  TaskDetailViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
//   任务名称
    @IBOutlet weak var nameLbl: UILabel!
//    任务详情
    @IBOutlet weak var detailLbl: UITextView!
    
    var taskId:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "任务详情"
    }
//关联知识点
    @IBAction func knowledgeBtn(sender: AnyObject) {
        let vc = KnowledgeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
// 截止时间
    @IBAction func endTimeBtn(sender: AnyObject) {
        let vc = EndTimeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
// 接收任务
    @IBAction func receiveTaskBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
