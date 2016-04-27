//
//  TeamModel.swift
//  xiaocool
//
//  Created by zhang on 16/4/19.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import Foundation
class TeamList: JSONJoy{
    var teamlist: [TeamModel]
    var count: Int{
        return self.teamlist.count
    }
    
    init(){
        teamlist = Array<TeamModel>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        teamlist = Array<TeamModel>()
        for childs: JSONDecoder in decoder.array!{
            teamlist.append(TeamModel(childs))
        }
    }
    
    func append(list: [TeamModel]){
        self.teamlist = list + self.teamlist
    }
}
class TeamModel: JSONJoy {
    var avatar:String?
    var member_name:String?
    var user_id:String?
    
    init(){
    }
    required init(_ decoder:JSONDecoder){
        avatar = decoder["avatar"].string
        member_name = decoder["member_name"].string
        user_id = decoder["user_id"].string
    }
}