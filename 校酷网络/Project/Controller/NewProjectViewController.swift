//
//  NewProjectViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class NewProjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "新建项目"
    }
//我已经了解了
    @IBAction func ISeeBtn(sender: AnyObject) {
        let vc = NewTwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
