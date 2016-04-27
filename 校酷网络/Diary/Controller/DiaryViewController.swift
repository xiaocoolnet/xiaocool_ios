//
//  DiaryViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/17.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import YYWebImage
import MBProgressHUD
import XWSwiftRefresh

class DiaryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
      let table = UITableView()
        override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(DiaryViewController.right))
        self.createTable()
        
    }
//    发表日记
    func right(){
        let vc = IssueViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//创建表
    func  createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-39)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
//    注册cell
        table.registerNib((UINib(nibName: "DiaryTableViewCell", bundle: nil)), forCellReuseIdentifier: "DiaryCellID")
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
        return 280
    }
    //    组间距
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
//    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DiaryCellID", forIndexPath: indexPath) as! DiaryTableViewCell
        cell.selectionStyle = .None
        cell.zanBtn.addTarget(self, action: #selector(DiaryViewController.dianzan(_:)), forControlEvents: .TouchUpInside)
        cell.zanBtn.setImage(UIImage(named: "zaned.png"), forState: .Selected)
        cell.commentBtn.addTarget(self, action: #selector(DiaryViewController.comment), forControlEvents: .TouchUpInside)
        return cell
    }
//    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
