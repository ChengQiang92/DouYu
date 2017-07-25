//
//  UIBarButtonItem-Extension.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/19.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func creatItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setImage(UIImage.init(named: highImageName), for: .selected)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)      
    }
 */
    
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .selected)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
    
}
