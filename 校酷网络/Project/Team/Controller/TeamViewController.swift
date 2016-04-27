//
//  TeamViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.createTable()
        self.view.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
    }
//   创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-39)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
//    注册cell
        table.registerNib((UINib(nibName: "TeamTableViewCell", bundle: nil)), forCellReuseIdentifier: "cell")
    }
//有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
//    每一组有几行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
//    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
//    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = TeamTableViewCell()
        cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.selectionStyle = .None
        return cell
    }
//    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = TeamChatViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
