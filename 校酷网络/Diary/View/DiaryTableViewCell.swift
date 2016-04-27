//
//  DiaryTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {

//    头像
    @IBOutlet weak var headImageView: UIImageView!
    
//    名称
    @IBOutlet weak var nameLbl: UILabel!
//    内容
    @IBOutlet weak var contentTextView: UITextView!
//    图片
    @IBOutlet weak var pictureImageView: UIImageView!
//    赞的个数
    @IBOutlet weak var zanLbl: UILabel!
//    评论的个数
    @IBOutlet weak var commentLbl: UILabel!
//    点赞按钮
    @IBOutlet weak var zanBtn: UIButton!
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
