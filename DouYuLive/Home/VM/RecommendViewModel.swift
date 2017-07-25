//
//  RecommendViewModel.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/20.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit
import SwiftyJSON

class RecommendViewModel {

    lazy var anchorGroups = [AnchorGroupModel]()
    
    lazy var cycleModels: [CycleModel] = [CycleModel]()
    
    fileprivate lazy var bigDataGroup = AnchorGroupModel()
    fileprivate lazy var prettyGroup = AnchorGroupModel()
    
}

extension RecommendViewModel {
    //推荐数据
    func requestData(finishedCallback: @escaping () -> ()) {
        
        let parameters = ["limit": "4", "offset": "0", "time" : Date.getCurrentTime()]
        print(Date.getCurrentTime())
        
        let dGroup = DispatchGroup()
        
        //请求第一部分推荐数据
        
        dGroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : Date.getCurrentTime()]) { [unowned self](result) in
            
            guard let resultDic = result as? [String: AnyObject] else { return }
            
            guard let dataArr = resultDic["data"] as? [[String : AnyObject]] else { return }
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            
            for dic in dataArr {
                let anchor = AnchorModel(dict: dic)
                self.bigDataGroup.anchors.append(anchor)
                
            }
            
            dGroup.leave()
            
        }
        
        //请求第二部分颜值数据
        
        dGroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { [unowned self](result) in
            
            guard let resultDic = result as? [String: AnyObject] else { return }
            
            guard let dataArr = resultDic["data"] as? [[String : AnyObject]] else { return }
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            
            for dic in dataArr {
                let anchor = AnchorModel(dict: dic)
                self.prettyGroup.anchors.append(anchor)
                
            }
            
            dGroup.leave()
            
        }
        
        //请求2-12部分游戏数据
        
        dGroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { [unowned self](result) in

            guard let resultDic = result as? [String: AnyObject] else { return }
            
            guard let dataArr = resultDic["data"] as? [[String : AnyObject]] else { return }
            
            for dic in dataArr {
                let group = AnchorGroupModel(dict: dic)
                self.anchorGroups.append(group)
            }
            dGroup.leave()
        }
        
        dGroup.notify(queue: DispatchQueue.main) {[unowned self] in
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishedCallback()
        }
    }
    
    //无限轮播数据
    func requestCycleData(finishedCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version": "2.300"]) { (result) in
            
            guard let resultDict = result as? [String: AnyObject] else { return }
            
            guard let dataArr = resultDict["data"] as? [[String: AnyObject]]  else { return }
            
            for dict in dataArr {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishedCallback()
        }
        
    }
}
