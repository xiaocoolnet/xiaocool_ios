//
//  DevelopTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DevelopTableViewCell: UITableViewCell {
    
//    头像
    @IBOutlet weak var headImageView: UIImageView!
//    项目名称
    @IBOutlet weak var nameLbl: UILabel!
//    项目阶段
    @IBOutlet weak var stageLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
