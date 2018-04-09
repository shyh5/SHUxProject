//
//  SHMainTabBarController.swift
//  podsTextSwift
//
//  Created by SHyH5 on 2017/9/19.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import UIKit

class SHMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = SHTabBar()
        setValue(tabBar, forKey: "tabBar")
        tabBar.tintColor = COLOR_NAV_BG

        prepareVc()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    fileprivate func prepareVc() {
        
        let essenceVc = SHHomeViewController()
        configChildViewController(essenceVc, title: "首页", imageName: "tabbar_video_icon_normal", selectedImageName: "tabbar_video_icon_selected")
        
        let newVc = SHCustomViewController()
        configChildViewController(newVc, title: "自定义", imageName: "tabbar_grammar_icon_normal", selectedImageName: "tabbar_grammar_icon_selected")
        
        let friendTrendsVc = SHChooseViewController()
        configChildViewController(friendTrendsVc, title: "选择", imageName: "tabbar_trends_icon_normal", selectedImageName: "tabbar_trends_icon_selected")
//
//        let profileVc = SHHomeViewController()
//        configChildViewController(profileVc, title: "我的", imageName: "tab_profile_icon_normal", selectedImageName: "tab_profile_icon_selected")
        
        // 布局完立马选中，防止崩溃
        selectedIndex = 0
    }

    
    /**
     配置TabBarController的子控制器
     
     - parameter childViewController: 子控制器
     - parameter title:               标题
     - parameter imageName:           默认图片名
     - parameter selectedImageName:   选中图片名
     */
    fileprivate func configChildViewController(_ childViewController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childViewController.title = title
        childViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childViewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 12)], for: UIControlState())
        childViewController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childViewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        
        let navigationC = SHMainNavigationController(rootViewController: childViewController)
        addChildViewController(navigationC)
    }

}


