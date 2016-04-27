//
//  ClassDetailViewController.swift
//  xiaocool
//
//  Created by zhang on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

//    背景图
    @IBOutlet weak var backImageView: UIImageView!
//    头像
    @IBOutlet weak var headImageView: UIImageView!
//    项目名称
    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "项目详情"
    }
    @IBAction func projectInfoBtn(sender: AnyObject) {
        let vc = InfoAndLightViewController()
        vc.nameString = "项目简介"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func projectLightBtn(sender: AnyObject) {
        let vc = InfoAndLightViewController()
        vc.nameString = "项目亮点"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func projectTeamBtn(sender: AnyObject) {
        let vc = PTeamViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
