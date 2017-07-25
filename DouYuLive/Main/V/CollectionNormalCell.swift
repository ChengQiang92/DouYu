//
//  CollectionNormalCell.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/20.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
    
    
    @IBOutlet weak var roomNameLabel: UILabel!
    

    override var anchor: AnchorModel? {
        didSet {
            super.anchor = anchor
            
            roomNameLabel.text = anchor?.room_name
        }
    }

}
