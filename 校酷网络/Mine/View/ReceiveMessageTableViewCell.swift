//
//  ReceiveMessageTableViewCell.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ReceiveMessageTableViewCell: UITableViewCell {
//    头像
    @IBOutlet weak var headImageView: UIImageView!
//    消息
    @IBOutlet weak var messageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
