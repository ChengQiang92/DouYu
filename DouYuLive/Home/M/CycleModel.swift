//
//  CycleModel.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/24.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    
    var title = ""
    var pic_url = ""
    var room: [String: AnyObject]? {
        didSet {
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    var anchor: AnchorModel?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
