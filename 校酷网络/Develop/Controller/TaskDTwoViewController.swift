//
//  TaskDTwoViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TaskDTwoViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var taskDetailTextVIew: UITextView!
    var taskId:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "任务详情"
    }
//附带知识点
    @IBAction func knowledgeBtn(sender: AnyObject) {
        let vc = KnowledgeTwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    接收人
    @IBAction func receivePersonBtn(sender: AnyObject) {
        let vc = ReceivePersonViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
