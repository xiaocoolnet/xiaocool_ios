//
//  TaskViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class TaskViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let user = NSUserDefaults.standardUserDefaults()
    var itemId:String?
    let table = UITableView()
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    var taskSource = TaskList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(TaskViewController.right))
        self.title = "任务"
        self.createSelectView()
        self.createTable()
        self.loadData()
        
    }
//    创建titleView
    func createSelectView(){
        let selectView = UIView()
        selectView.frame = CGRectMake(30, 74, WIDTH-60, 35)
        selectView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(selectView)
//        我收到的任务按钮
        btn1.frame = CGRectMake(0, 0, (WIDTH-60)/3, 35)
        btn1.setBackgroundImage(UIImage(named: "我收到的_未选中.png"), forState: .Normal)
        btn1.setBackgroundImage(UIImage(named: "我收到的_选中.png"), forState: .Selected)
        btn1.addTarget(self, action: #selector(TaskViewController.receiveTask), forControlEvents: .TouchUpInside)
        btn1.selected = true
        selectView.addSubview(btn1)
//        我发起的任务按钮
        btn2.frame = CGRectMake((WIDTH-60)/3, 0, (WIDTH-60)/3, 35)
        btn2.setBackgroundImage(UIImage(named: "我发起的_未选中.png"), forState: .Normal)
        btn2.setBackgroundImage(UIImage(named: "我发起的_选中.png"), forState: .Selected)
        btn2.addTarget(self, action: #selector(TaskViewController.startTask), forControlEvents: .TouchUpInside)
        selectView.addSubview(btn2)
//        项目任务按钮
        btn3.frame = CGRectMake((WIDTH-60)/3*2, 0, (WIDTH-60)/3, 35)
        btn3.setBackgroundImage(UIImage(named: "项目任务_未选中.png"), forState: .Normal)
        btn3.setBackgroundImage(UIImage(named: "项目任务_选中.png"), forState: .Selected)
        btn3.addTarget(self, action: #selector(TaskViewController.projectTask), forControlEvents: .TouchUpInside)
        selectView.addSubview(btn3)
        
    }
//    发起任务
    func right(){
        let vc = StartTaskViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    我收到的任务
    func receiveTask(){
        btn1.selected = true
        btn2.selected = false
        btn3.selected = false
        table.reloadData()
    }
//    我发起的任务
    func startTask(){
        btn1.selected = false
        btn2.selected = true
        btn3.selected = false
        table.reloadData()
    }
//    项目任务
    func projectTask(){
        btn1.selected = false
        btn2.selected = false
        btn3.selected = true
        table.reloadData()
    }
//    加载数据
    func loadData() {
        let userid = user.valueForKey("userid") as? String
        let url = projectUrl + "gettasklist"
        let param:[String : AnyObject] = [
            "projectid":itemId!,
            "userid":userid!,
            "token":"xiaocoolself"
        ]
        Alamofire.request(.GET, url, parameters:param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let http = Http(JSONDecoder(json!))
                print("状态是")
                print(http.status)
                if(http.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(http.status == "success"){
                    self.taskSource = TaskList(http.data!)
                    self.table.reloadData()
                    self.table.headerView?.endRefreshing()
                }
            }
        }
       
    }
    //    创建表
    func createTable(){
        table.frame = CGRectMake(0, 119, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 65
        table.separatorStyle = .None
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
        //        注册cell
        table.registerNib(UINib.init(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewID")
        
    }
    //    有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if btn3.selected {
           return self.taskSource.count
        }
        return 0
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskTableViewID", forIndexPath: indexPath) as! TaskTableViewCell
        cell.selectionStyle = .None
        if btn3.selected {
            let taskList = self.taskSource.tasklist[indexPath.row]
            cell.titleLbl.text = taskList.title
            if taskList.begin_time == "0"{
               cell.timeLbl.text = "今天"
            }else if taskList.begin_time == "1"{
                cell.timeLbl.text = "昨天"
            }else{
                cell.timeLbl.text = "几天前"
            }
            
            
            cell.contentLbl.text = taskList.content
        }
        return cell
    }
    //    单元格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let taskList = self.taskSource.tasklist[indexPath.row]
        if(btn1.selected){
            let vc:UIViewController = TaskDetailViewController()
            vc.setValue(taskList.id, forKey: "taskId")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(btn2.selected || btn3.selected){
            let vc:UIViewController = TaskDTwoViewController()
            vc.setValue(taskList.id, forKey: "taskId")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
////    时间处理
//    func timeDo() {
//        let date = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "MM-dd"
//        let dateString = formatter.stringFromDate(date)
//        print(dateString)
//    }
}
