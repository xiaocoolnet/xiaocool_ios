//
//  ReceivePersonViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ReceivePersonViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "接收人"
        self.createTable()
    }
//创建表
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
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.selectionStyle = .None
        let lineView = UIView()
        lineView.frame = CGRectMake(0, 50, WIDTH, 1)
        lineView.backgroundColor = UIColor.lightGrayColor()
        cell.addSubview(lineView)

        cell.accessoryType = .None
        if (indexPath.row == 0){
            cell.imageView?.image = UIImage(named: "头像.png")
            cell.textLabel?.text = "李春波"
            cell.accessoryType = .Checkmark
        }
        if (indexPath.row == 1){
            cell.imageView?.image = UIImage(named: "头像.png")
            cell.textLabel?.text = "李夏波"
        }
        if (indexPath.row == 2){
            cell.imageView?.image = UIImage(named: "头像.png")
            cell.textLabel?.text = "李秋波"
        }
        if (indexPath.row == 3){
            cell.imageView?.image = UIImage(named: "头像.png")
            cell.textLabel?.text = "李冬波"
        }
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        if(selectedCell!.accessoryType == .None){
            selectedCell!.accessoryType = .Checkmark
        }else{
            selectedCell!.accessoryType = .None
        }
    }
}
