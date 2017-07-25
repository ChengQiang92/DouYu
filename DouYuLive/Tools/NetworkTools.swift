//
//  NetworkTools.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/20.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NetworkTools {
    class func requestData(_ type: HTTPMethod, URLString: String, parameters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        Alamofire.request(URLString, method: type, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            finishedCallback(result)
            
        }
    }
}
