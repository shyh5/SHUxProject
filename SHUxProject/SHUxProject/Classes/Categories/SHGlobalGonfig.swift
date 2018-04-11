//
//  SHGlobalGonfig.swift
//  podsTextSwift
//
//  Created by SHyH5 on 2017/9/1.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import Foundation
import UIKit
import Reusable

let kWindow = UIApplication.shared.keyWindow

let SCREEN_BOUNDS = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height
let IPHONE_NAVIGATION_HEIGHT = UIApplication.shared.statusBarFrame.height + CGFloat(44)

/// 导航栏背景色 - 绿色
let COLOR_NAV_BG = UIColor.colorWithHexString("41ca61")

/// 导航栏ITEM默认 - 白色
let COLOR_NAV_ITEM_NORMAL = UIColor(red:0.95, green:0.98, blue:1.00, alpha:1.00)

/// 导航栏ITEM高亮 - 偏白
let COLOR_NAV_ITEM_HIGH = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)

///橘黄色
let kOrangeColor = UIColor.colorWithHexString("#FFBA68")

///通知的默认宏定义
let kPushAdv = "kPushAdv"

extension UIView : NibReusable {}


//extension UINavigationBar {
//    var navbarView: UIView? {
//        get {
//           return objc_getAssociatedObject(self, &self.navbarView) as? UIView
//        }
//
//        set {
//            objc_setAssociatedObject(self, &self.navbarView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
//        }
//    }
//
//    func setNavigationBackgroundColor (backgroundColor: UIColor) -> Void {
//
//        if (self.navbarView == nil) {
//
//            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//            self.navbarView = UIView.init(frame: CGRect.init(x: 0, y: -20, width: SCREEN_WIDTH, height: 64))
//            self.navbarView!.isUserInteractionEnabled = false
//            self.insertSubview(self.navbarView!, at: 0)
//        }
//
//        self.navbarView!.backgroundColor = backgroundColor
//    }
//}

extension UINavigationBar {
    
    private struct AssociatedKeys {
        static var navbarView: Void?
        static var navbarBgAlpha: Void?
    }
    
    var navigationGradualChangeBackgroundView:UIView?{
        
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.navbarView) as? UIView
        }
        
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.navbarView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
//    var navbarBgAlpha: CGFloat {
//        get {
////           return objc_getAssociatedObject(self, &self.navbarBgAlpha) as? CGFloat
//            guard let alpha = objc_getAssociatedObject(self, &AssociatedKeys.navbarBgAlpha) as? CGFloat else { return 1.0 }
//            return alpha
//        }
//
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.navbarBgAlpha, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//
//            self.sh_setNavBarAlpha(newValue)
//        }
//
//    }
    
    func setNavigationBackgroundColor (backgroundColor: UIColor) -> Void {
        navigationGradualChangeBackgroundView?.removeFromSuperview()
        navigationGradualChangeBackgroundView = nil
        if (self.navigationGradualChangeBackgroundView == nil) {
            
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationGradualChangeBackgroundView = UIView.init(frame: CGRect.init(x: 0, y: -20, width: SCREEN_WIDTH, height: 64 + 20 ))
            self.navigationGradualChangeBackgroundView!.isUserInteractionEnabled = false
            //self.insertSubview(self.navigationGradualChangeBackgroundView!, at: 0)
            subviews.first?.insertSubview(self.navigationGradualChangeBackgroundView ?? UIView(), at: 0)
        }
        
        self.navigationGradualChangeBackgroundView!.backgroundColor = backgroundColor
    }
    
    func removeNavigationBackgroundColor() -> Void {
        self.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationGradualChangeBackgroundView!.removeFromSuperview()
        self.navigationGradualChangeBackgroundView = nil
    }
    
    
    fileprivate func setNeedsNavigationBarUpdate(barBackgroundAlpha: CGFloat)
    {
        self.sh_setNavBarAlpha(barBackgroundAlpha)
    }
    
    //改变导航栏的颜色
     func sh_setNavBarAlpha(_ alpha:CGFloat) -> Void {
        if let backView = subviews.first {
            if #available(iOS 11.0, *) {
                for view in backView.subviews {
                    view.alpha = alpha
                }
            } else {
                backView.alpha = alpha
            }
        }
    }
}

