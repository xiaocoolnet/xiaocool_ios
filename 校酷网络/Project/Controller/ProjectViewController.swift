//
//  ProjectViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit


class ProjectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let table = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//个人中心
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "person")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(ProjectViewController.Left))
        self.automaticallyAdjustsScrollViewInsets = false
//        创建表
         self.createTable()
    }
//    个人中心
    func  Left(){
        let vc = PersonViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    创建表
    func createTable(){
        
        table.frame = CGRectMake(0, 64, WIDTH, HEIGHT-64-39)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
//        注册cell
        table.registerNib(UINib.init(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectCellID")
    
    }
//    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
           return 2
        }
//    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 162
    }
//    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCellID", forIndexPath: indexPath) as! ProjectTableViewCell
        cell.selectionStyle = .None
        cell.zanButton.addTarget(self, action: #selector(ProjectViewController.dianzan(_:)), forControlEvents: .TouchUpInside)
        cell.zanButton.setImage(UIImage(named: "zaned.png"), forState: .Selected)
        cell.commentBtn.addTarget(self, action: #selector(ProjectViewController.comment), forControlEvents: .TouchUpInside)
       return cell
    }
//    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc:UIViewController = ProjectDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //    点赞
    func dianzan(zanbtn:UIButton){
        if zanbtn.selected {
            zanbtn.selected = false
        }else{
            zanbtn.selected = true
        }
    }
    //    评论
    func comment(){
        let vc = CommentViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
