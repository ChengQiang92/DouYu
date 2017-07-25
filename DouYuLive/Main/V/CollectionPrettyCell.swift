//
//  CollectionPrettyCell.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/20.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {


    
    @IBOutlet weak var cityBtn: UIButton!
    
    
    override var anchor: AnchorModel? {
        didSet {
            super.anchor = anchor
            
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)

        }
    }

}
