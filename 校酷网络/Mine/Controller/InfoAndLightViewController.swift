//
//  InfoAndLightViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class InfoAndLightViewController: UIViewController {
    var nameString:String?
    var projectInfo:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = nameString
        //编辑
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style:.Plain, target: self, action: #selector(InfoAndLightViewController.right))
        self.createUI()
    }
    func right() {
    
    }
    //    创建内容label
    func createUI(){
        let contentTextView = UITextView(frame: CGRectMake(0, 0, WIDTH, HEIGHT))
//        contentTextView.text = "如果你无法简洁的表达你的想法，那只说明你还不够了解它。\n－阿尔伯特·爱因斯坦"
        contentTextView.text = self.projectInfo
        contentTextView.font = UIFont.systemFontOfSize(15)
        contentTextView.editable = false
        self.view.addSubview(contentTextView)
    }
}
