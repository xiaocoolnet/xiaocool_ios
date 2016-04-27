//
//  TaskModel.swift
//  xiaocool
//
//  Created by zhang on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import Foundation
class TaskList: JSONJoy{
    var tasklist: [TaskModel]
    var count: Int{
        return self.tasklist.count
    }
    
    init(){
        tasklist = Array<TaskModel>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        tasklist = Array<TaskModel>()
        for childs: JSONDecoder in decoder.array!{
            tasklist.append(TaskModel(childs))
        }
    }
    
    func append(list: [TaskModel]){
        self.tasklist = list + self.tasklist
    }
}
class TaskModel: JSONJoy {
    var begin_time:String?
    var content:String?
    var days:String?
    var end_time:String?
    var id:String?
    var projectid:String?
    var title:String?
    var userid:String?
    var username:String?
    
    init(){
    }
    required init(_ decoder:JSONDecoder){
        begin_time = decoder["begin_time"].string
        content = decoder["content"].string
        days = decoder["days"].string
        end_time = decoder["end_time"].string
        id = decoder["id"].string
        projectid = decoder["projectid"].string
        title = decoder["title"].string
        userid = decoder["userid"].string
        username = decoder["username"].string
    }
}