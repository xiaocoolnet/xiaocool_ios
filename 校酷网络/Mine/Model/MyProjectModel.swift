
//
//  MyProjectModel.swift
//  xiaocool
//
//  Created by zhang on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import Foundation
class MyProjectList: JSONJoy{
    var probjectlist: [MyProjectModel]
    var count: Int{
        return self.probjectlist.count
    }
    
    init(){
        probjectlist = Array<MyProjectModel>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        probjectlist = Array<MyProjectModel>()
        for childs: JSONDecoder in decoder.array!{
            probjectlist.append(MyProjectModel(childs))
        }
    }
    
    func append(list: [MyProjectModel]){
        self.probjectlist = list + self.probjectlist
    }
}
class MyProjectModel: JSONJoy {
    var item_id:String?
    var item_info:String?
    var item_poster:String?
    var item_title:String?
    
    init(){
    }
    required init(_ decoder:JSONDecoder){
        item_id = decoder["item_id"].string
        item_info = decoder["item_info"].string
        item_poster = decoder["item_poster"].string
        item_title = decoder["item_title"].string
    }
}