//
//  CollectionCycleCell.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/24.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    var cycleModel: CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: iconURL, placeholder: #imageLiteral(resourceName: "Img_default"))
            
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
