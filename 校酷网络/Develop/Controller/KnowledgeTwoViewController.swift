//
//  KnowledgeTwoViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class KnowledgeTwoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "附带知识点"
        self.createTable()
    }
//创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 40
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
//    注册cell
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        if (indexPath.row == 0){
            cell.textLabel?.text = "安卓界面的布局"
        }
        if (indexPath.row == 1){
            cell.textLabel?.text = "百度地图的调用"
        }
        return cell
    }
}
