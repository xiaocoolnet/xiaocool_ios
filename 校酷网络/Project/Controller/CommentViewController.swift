//
//  CommentViewController.swift
//  校酷网络
//
//  Created by zhang on 16/4/7.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "评论列表"
        self.view.backgroundColor = UIColor(red: 235.0/255.0, green: 231.0/255.0, blue: 241.0/255.0, alpha: 1)
//        写评论
        let rightItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(CommentViewController.NewComment))
        self.navigationItem.rightBarButtonItem = rightItem
//创建表
        self.creatTable()
    }
//    写评论
    func NewComment(){
        let newComment = NewCommentViewController()
        self.navigationController?.pushViewController(newComment, animated: true)
    }
//    创建表
    func creatTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT-49)
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 244.0/255.0, alpha: 1)
        self.view.addSubview(table)
        
        //        注册cell
        table.registerNib(UINib.init(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentCellID")
    }
    //    每一组有几个
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    //    单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCellID", forIndexPath: indexPath) as! CommentTableViewCell
        cell.selectionStyle = .None
        if indexPath.row == 1 {
            cell.contentLbl.text = "fasdssdcsskvhasjdvnksjbv"
        }
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = String(cell.contentLbl.text).boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        table.rowHeight = boundingRect.size.height + 50
        return cell
    }
//    行高
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        
////        return 100
//    }
}
