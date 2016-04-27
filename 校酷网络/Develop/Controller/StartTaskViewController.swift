//
//  StartTaskViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class StartTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "发起任务"
    }
//    任务名称
    @IBAction func nameBtn(sender: AnyObject) {
        let vc = ProjectNameViewController()
        vc.nameString = "任务名称"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
//任务详情
    @IBAction func detailBtn(sender: AnyObject) {
        let vc = TaskTypeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    截止时间
    @IBAction func endTimeBtn(sender: AnyObject) {
        let vc = TaskEndTimeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    关联知识点
    @IBAction func knowledgebtn(sender: AnyObject) {
        let vc = TaskKnowledgeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    接收人
    @IBAction func receivePersonBtn(sender: AnyObject) {
        let vc = ReceivePersonTwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    发起
    @IBAction func startBtn(sender: AnyObject) {
    }
}
