//
//  TaskTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
//    标题
    @IBOutlet weak var titleLbl: UILabel!
//    内容
    @IBOutlet weak var contentLbl: UILabel!
//    时间
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
