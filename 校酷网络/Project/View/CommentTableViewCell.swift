//
//  CommentTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/4/7.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

//    评论者名称
    @IBOutlet weak var nameLbl: UILabel!
//    评论的内容
    @IBOutlet weak var contentLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
