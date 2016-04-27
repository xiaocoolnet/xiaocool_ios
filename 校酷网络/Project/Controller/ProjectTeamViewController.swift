//
//  ProjectTeamViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ProjectTeamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "项目团队"
        self.view.backgroundColor = UIColor.whiteColor()
        self.createTable()
    }
//创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-39)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.rowHeight = 110
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
//        注册cell
       table.registerNib(UINib(nibName: "ProjectTeamTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectTeamID")
    }
    //    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    //    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectTeamID", forIndexPath: indexPath) as! ProjectTeamTableViewCell
        cell.headImageVIew.image = UIImage(named: "头像.png")
        cell.contentTextView.text = "如果你无法简洁的表达你的想法，那只说明你还不够了解它。\n－阿尔伯特·爱因斯坦"
        cell.selectionStyle = .None
        if (indexPath.section == 1){
            cell.nameLbl.text = "李云龙·技术总监"
        }
        if (indexPath.section == 2){
            cell.nameLbl.text = "周颖·市场总监"
        }
        return cell
    }
}
