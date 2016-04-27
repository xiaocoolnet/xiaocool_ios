//
//  ReceivemessageViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ReceivemessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我收到的消息"
        self.createTable()
    }
    //    创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 50
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
        //        注册cell
        table.registerNib(UINib.init(nibName: "ReceiveMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceiveMessageID")
        
    }
    //    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceiveMessageID", forIndexPath: indexPath) as! ReceiveMessageTableViewCell
        cell.selectionStyle = .None
        if indexPath.row == 1{
           cell.messageLbl.text = "欢迎加入"
        }
        return cell
    }
}
