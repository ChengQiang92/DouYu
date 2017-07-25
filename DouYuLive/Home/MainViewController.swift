//
//  MainViewController.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/18.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
    
        
    }
    
    private func addChildVC(storyName: String) {
        let chileVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(chileVC)
    }


}
