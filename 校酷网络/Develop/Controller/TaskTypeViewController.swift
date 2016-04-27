//
//  TaskTypeViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TaskTypeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "任务类型"
        self.createTable()
    }
//创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
//        设置表头
        let label = UILabel()
        label.frame = CGRectMake(0, 0, WIDTH, 20)
        label.backgroundColor = UIColor(red: 35.0/255.0, green: 152.0/255.0, blue: 136.0/255.0, alpha: 1)
        label.text = "不同的任务类型对应不同的多任务模版"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(14)
        table.tableHeaderView = label
//        注册cell
        table.registerNib((UINib(nibName: "TaskTypeTableViewCell", bundle: nil)), forCellReuseIdentifier: "TaskTypeID")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 7
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskTypeID", forIndexPath: indexPath) as! TaskTypeTableViewCell
        cell.selectionStyle = .None
        if(indexPath.row == 1){
            cell.taskTypeBtn.setTitle("需求分析与功能模块", forState: .Normal)
        }
        if(indexPath.row == 2){
            cell.taskTypeBtn.setTitle("功能函数列表", forState: .Normal)
        }
        if(indexPath.row == 3){
            cell.taskTypeBtn.setTitle("伪代码编写", forState: .Normal)
        }
        if(indexPath.row == 4){
            cell.taskTypeBtn.setTitle("IOS编码", forState: .Normal)
        }
        if(indexPath.row == 5){
            cell.taskTypeBtn.setTitle("android编码", forState: .Normal)
        }
        if(indexPath.row == 6){
            cell.taskTypeBtn.setTitle("其他", forState: .Normal)
        }
        if(indexPath.row == 0){
            cell.taskTypeBtn.addTarget(self, action: #selector(TaskTypeViewController.yuanXing), forControlEvents: .TouchUpInside)
        
        }
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    func yuanXing(){
        let vc = TaskTypeTwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
