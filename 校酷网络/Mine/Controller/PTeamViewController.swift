//
//  PTeamViewController.swift
//  校酷网络
//
//  Created by zhang on 16/3/23.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import YYWebImage
import MBProgressHUD

class PTeamViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let table = UITableView()
    var itemId:String?
    var teamSource = TeamList()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "项目团队"
        self.createTable()
        self.loadData()
    }
//    加载信息
    func loadData() {
        let url = projectUrl + "getteamlist"
        let param = [
            "projectid":itemId!,
            "token":"xiaocoolself"
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
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
                    self.teamSource = TeamList(http.data!)
                    self.table.reloadData()
                }
            }
        }
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
        return self.teamSource.count
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
        cell.selectionStyle = .None
        let team = self.teamSource.teamlist[indexPath.section]
        cell.nameLbl.text = team.member_name
        if  team.avatar != nil{
            let imgUrl = imageUrl+(team.avatar)!
            let avatarUrl = NSURL(string: imgUrl)
            cell.headImageVIew.yy_setImageWithURL(avatarUrl, placeholder: UIImage(named: "头像.png"))
        }
        
//        cell.headImageVIew.image = UIImage(named: "头像.png")
        cell.contentTextView.text = "如果你无法简洁的表达你的想法，那只说明你还不够了解它。\n－阿尔伯特·爱因斯坦"
//        if (indexPath.section == 1){
//            cell.nameLbl.text = "李云龙·技术总监"
//        }
//        if (indexPath.section == 2){
//            cell.nameLbl.text = "周颖·市场总监"
//        }
        return cell
    }
}
