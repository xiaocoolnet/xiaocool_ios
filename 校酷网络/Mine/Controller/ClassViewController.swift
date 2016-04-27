//
//  ClassViewController.swift
//  xiaocool
//
//  Created by zhang on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的课程"
        //        创建表
        self.createTable()
    }
    //    创建表
    func createTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-39)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 120
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
        //        注册cell
        table.registerNib(UINib.init(nibName: "ProjectAndClassTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    //    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
        var cell:UITableViewCell = ProjectAndClassTableViewCell()
        cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.selectionStyle = .None
        return cell
    }
    //    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc:UIViewController = ClassDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
