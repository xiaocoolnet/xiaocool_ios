//
//  ProjectTeamTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ProjectTeamTableViewCell: UITableViewCell {
//    头像
    @IBOutlet weak var headImageVIew: UIImageView!
//    姓名
    @IBOutlet weak var nameLbl: UILabel!
//    内容
    @IBOutlet weak var contentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
