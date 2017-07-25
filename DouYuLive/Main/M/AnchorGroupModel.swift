//
//  AnchorGroupModel.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/20.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

class AnchorGroupModel: NSObject {
    
    var room_list: [[String: AnyObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    
    lazy var anchors = [AnchorModel]()
    
    var tag_name: String = ""
    
    var icon_name = "home_header_normal"
    
    var icon_url = ""
    
    override init() {
        
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    
    
}
