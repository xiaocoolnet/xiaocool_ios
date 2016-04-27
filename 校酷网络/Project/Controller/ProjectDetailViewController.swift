//
//  ProjectDetailViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/21.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "项目详情"
        self.createTable()
    }
//    创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        //        创建表头
        let headView = UIView()
        headView.frame = CGRectMake(0, 0, WIDTH, 160)
        table.tableHeaderView = headView
        //        背景图
        let backImageView = UIImageView()
        backImageView.frame = CGRectMake(0, 0, WIDTH, 160)
        backImageView.image = UIImage(named: "b.png")
        backImageView.alpha = 0.5
        headView.addSubview(backImageView)
        //        头像
        let headImageView = UIImageView()
        headImageView.frame = CGRectMake(WIDTH/2-50, 2, 100, 100)
        headImageView.image = UIImage(named: "b.png")
        headImageView.cornerRadius = 50
        headView.addSubview(headImageView)
        //        名称
        let nameLbl = UILabel()
        nameLbl.frame = CGRectMake(20, 120, WIDTH-40, 20)
        nameLbl.text = "校园合伙人"
        nameLbl.font = UIFont.boldSystemFontOfSize(20)
        nameLbl.textAlignment = .Center
        headView.addSubview(nameLbl)
        //        创建表尾
        let footView = UIView()
        footView.frame = CGRectMake(0, 0, WIDTH, 50)
        table.tableFooterView = footView
//        我要加入按钮
        let joinBtn = UIButton()
        joinBtn.frame = CGRectMake(10, 10, (WIDTH-50)/2, 30)
        joinBtn.cornerRadius = 5
        joinBtn.backgroundColor = UIColor(red: 0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1)
        joinBtn.setTitle("我要加入", forState: .Normal)
        joinBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        joinBtn.addTarget(self, action: #selector(ProjectDetailViewController.joinBtn), forControlEvents: .TouchUpInside)
        footView.addSubview(joinBtn)
//        我要融资按钮
        let raiseFundsBtn = UIButton()
        raiseFundsBtn.frame = CGRectMake((WIDTH-50)/2+40, 10, (WIDTH-50)/2, 30)
        raiseFundsBtn.cornerRadius = 5
        raiseFundsBtn.backgroundColor = UIColor(red: 0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1)
        raiseFundsBtn.setTitle("我要融资", forState: .Normal)
        raiseFundsBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        raiseFundsBtn.addTarget(self, action: #selector(ProjectDetailViewController.raiseFundsBtn), forControlEvents: .TouchUpInside)
        footView.addSubview(raiseFundsBtn)
        //        注册Cell
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
//    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //    有几行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 3
        }
        if(section == 1){
            return 1
        }
        return 0
    }
//    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    //    行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        //        分割线
        let lineView = UIView()
        lineView.frame = CGRectMake(0, 50, WIDTH, 1)
        lineView.backgroundColor = UIColor.lightGrayColor()
        cell.addSubview(lineView)
        
        if(indexPath.section == 0){
            if (indexPath.row == 0){
                cell.textLabel?.text = "项目简介"
            }
            if (indexPath.row == 1){
                cell.textLabel?.text = "项目亮点"
            }
            if (indexPath.row == 2){
                cell.textLabel?.text = "项目阶段"
            }
        }
        if(indexPath.section == 1){
            if (indexPath.row == 0){
                cell.textLabel?.text = "项目团队"
            }
        }
    
        return cell
    }
    //    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0){
            if (indexPath.row == 0){
                let vc = IntroduceViewController()
                vc.nameString = "项目简介"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if (indexPath.row == 1){
                let vc = IntroduceViewController()
                vc.nameString = "项目亮点"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if (indexPath.row == 2){
                let vc = IntroduceViewController()
                vc .setValue("项目阶段", forKey: "nameString")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        if(indexPath.section == 1){
            if (indexPath.row == 0){
                let vc = ProjectTeamViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
//我要加入
    func joinBtn(){
    
    }
//    我要融资
    func raiseFundsBtn(){
    
    }
}
