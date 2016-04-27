//
//  ProjectTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/21.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
//    头像
    @IBOutlet weak var headImageView: UIImageView!
//    题目
    @IBOutlet weak var titleLabel: UILabel!
//    内容简介
    @IBOutlet weak var contentLabel: UITextView!
//    点赞次数
    @IBOutlet weak var likeLabel: UILabel!
//    评论次数
    @IBOutlet weak var commentLabel: UILabel!
//    点赞按钮
    @IBOutlet weak var zanButton: UIButton!
//    评论按钮
    @IBOutlet weak var commentBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
