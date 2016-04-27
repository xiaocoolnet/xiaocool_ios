//
//  UserInfoModel.swift
//  校酷网络
//
//  Created by zhang on 16/4/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import Foundation
class UserInfoList: JSONJoy{
    var status:String?
    var data:UserInfoModel?
    var errorData:String?
    var datastring:String?
    //var uid:String?
    init(){
    }
    required init(_ decoder:JSONDecoder){
        status = decoder["status"].string
        if status == "success"{
            data = UserInfoModel(decoder["data"])
        }else{
            errorData = decoder["data"].string
        }
        
    }
}
class UserInfoModel: JSONJoy {
    var id:String?
    var user_nicename:String?
    var sex:String?
    var city:String?
    var age:String?
    var avatar:String?
    var signature:String?
    init(){
    }
    required init(_ decoder:JSONDecoder){
        id = decoder["id"].string
        signature = decoder["signature"].string
        user_nicename = decoder["user_nicename"].string
        sex = decoder["sex"].string
        city = decoder["city"].string
        age = decoder["age"].string
        avatar = decoder["avatar"].string
    }
}