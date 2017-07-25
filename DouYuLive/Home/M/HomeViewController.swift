//
//  HomeViewController.swift
//  DouYuLive
//
//  Created by 程强 on 2017/7/18.
//  Copyright © 2017年 程强. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageTitleView: PageTitleView = {[unowned self] in
        let titleFrame = CGRect(x: 0, y: kStatuesBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView.init(frame: titleFrame, titles: titles)
        
        titleView.delegate = self
        
        return titleView
    }()
    
    fileprivate lazy var pageContentView: PageContentView = {[unowned self] in
        let contentH = kScreenH - kStatuesBarH - kNavigationBarH - kTitleViewH - kTabBarH
        let contentFrame = CGRect(x: 0, y: kStatuesBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVCs = [UIViewController]()
        childVCs.append(RecommendViewController())
        
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)), alpha: 1)
            childVCs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVCs: childVCs, parentVC: self)
        
        contentView.delegate = self
        
        return contentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }


}

//设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        
        //不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setupNavigationBar()
        
        //添加TitleView
        view.addSubview(pageTitleView)
        
        //添加ContntView
        view.addSubview(pageContentView)
        
    }
    
    fileprivate func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        

        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
    }
}

extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension HomeViewController: PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}


















