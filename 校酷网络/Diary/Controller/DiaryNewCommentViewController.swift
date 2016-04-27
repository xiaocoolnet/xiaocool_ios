//
//  DiaryNewCommentViewController.swift
//  校酷网络
//
//  Created by zhang on 16/4/7.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MBProgressHUD

class DiaryNewCommentViewController: UIViewController {

    let contentTextView = BRPlaceholderTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "发表评论"
        self.view.backgroundColor = UIColor.whiteColor()
        let rightItem = UIBarButtonItem(title: "发表", style: .Done, target: self, action: #selector(DiaryNewCommentViewController.UpdateComment))
        self.navigationItem.rightBarButtonItem = rightItem
        self.creatTextView()
    }
    func UpdateComment(){
        
    }
    func creatTextView(){
        self.contentTextView.frame = CGRectMake(8, 5, self.view.bounds.width - 16, 200)
        self.contentTextView.font = UIFont.systemFontOfSize(15)
        self.contentTextView.placeholder = "请输入内容～不能超过200字啦"
        self.contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        self.view.addSubview(self.contentTextView)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
