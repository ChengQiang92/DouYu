//
//  CollectionGameCell.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/24.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    var group: AnchorGroupModel? {
        didSet {
            titleLabel.text = group?.tag_name
            let iconURL = URL(string: group?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconURL, placeholder: #imageLiteral(resourceName: "home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
