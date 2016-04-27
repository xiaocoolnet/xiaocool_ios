//
//  MyProjectDetailViewController.swift
//  xiaocool
//
//  Created by zhang on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import YYWebImage
import MBProgressHUD

class MyProjectDetailViewController: UIViewController {

//    背景图
    @IBOutlet weak var backImageView: UIImageView!
//    头像
    @IBOutlet weak var headImageView: UIImageView!
//    项目名称
    @IBOutlet weak var nameLbl: UILabel!
    
    var itemId:String?
    var projectIntro = String()
    var projectLight = String()
    var projectSource = MyProjectList()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "项目详情"
        self.loadData()
    }
//    加载数据
    func loadData(){
        let url = projectUrl + "getprojectinfo"
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
                    let projectInfo = MyProjectModel(http.data!)
                    self.nameLbl.text = projectInfo.item_title
//                  头像
                    let imgUrl = imageUrl+(projectInfo.item_poster)!
                    let avatarUrl = NSURL(string: imgUrl)
                    self.headImageView.yy_setImageWithURL(avatarUrl, placeholder: UIImage(named: "b.png"))
//                  项目简介
                    self.projectIntro = projectInfo.item_info!
//                  项目亮点
                    self.projectLight = projectInfo.item_info!
                }
            }
        }
    }
    @IBAction func projectInfoBtn(sender: AnyObject) {
        let vc = InfoAndLightViewController()
        vc.nameString = "项目简介"
        vc.projectInfo = self.projectIntro
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func projectLightBtn(sender: AnyObject) {
        let vc = InfoAndLightViewController()
        vc.nameString = "项目亮点"
        vc.projectInfo = self.projectLight
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func projectTeamBtn(sender: AnyObject) {
        let vc = PTeamViewController()
        vc.itemId = self.itemId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
