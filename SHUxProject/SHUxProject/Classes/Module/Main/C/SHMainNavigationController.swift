//
//  SHMainNavigationController.swift
//  podsTextSwift
//
//  Created by SHyH5 on 2017/9/19.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import UIKit

class SHMainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)

        let navBar = navigationBar
        //navBar.barTintColor = UIColor.colorFromRGB(0x666666)
        navBar.isTranslucent = false
       // navBar.barStyle = UIBarStyle.black
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        
    
        // 导航栏背景色
        navigationBar.titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "PingFangSC-Regular", size: 18)! ,
            NSForegroundColorAttributeName : UIColor.colorFromRGB(0xFFFFFF)
        ]
        
        let later = CAGradientLayer()
        later.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: IPHONE_NAVIGATION_HEIGHT)
        
        navBar.subviews[0].layer.addSublayer(later)
        
        later.startPoint = CGPoint(x: 0, y: 0)
        later.endPoint = CGPoint(x: 1, y: 0)
        later.locations = [0.0,1.0]
        
        later.colors = [UIColor.colorFromRGB(0x00BAFF).cgColor,
                        UIColor.colorFromRGB(0x00BAFF).cgColor]
    
    }
    
    
    /**
     拦截push操作，修改需要push的控制器的返回按钮
     
     - parameter viewController: 需要push的控制器
     - parameter animated:       是否有push动画
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.leftItem("app_white_back", highlightedImage: "app_white_back", target: self, action: #selector(didTappedBackButton(_:)))
            viewController.hidesBottomBarWhenPushed = true
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    /**
     返回事件
     */
    @objc fileprivate func didTappedBackButton(_ button: UIBarButtonItem) {
        popViewController(animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
