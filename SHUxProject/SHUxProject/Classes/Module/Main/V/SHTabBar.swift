//
//  SHTabBar.swift
//  podsTextSwift
//
//  Created by SHyH5 on 2017/9/19.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import UIKit

protocol SHTabBarDelegate : NSObjectProtocol {
    func didTappedAddButton()
}

class SHTabBar: UITabBar {
    
    weak var tabbarDelegate : SHTabBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         shadowImage = UIImage()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     +号按钮点击事件
     */
    @objc fileprivate func didTappedAddButton(_ button: UIButton) {
        tabbarDelegate?.didTappedAddButton()
    }
    
    /**
     重新布局tabBar子控件
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 重新布局tabBarButton
        let y: CGFloat = 0
        let width: CGFloat = SCREEN_WIDTH / 3
        let height: CGFloat = 49
        
        var index = 0
        for view in subviews {
            if !view.isKind(of: NSClassFromString("UITabBarButton")!) {
                // 隐藏tabBar顶部横线
                if view.isKind(of: NSClassFromString("UIImageView")!) && view.bounds.size.height <= 1 {
                    view.isHidden = true
                }
                continue
            }
            
            //let x = CGFloat(index > 1 ? index + 1 : index) * width
           // print("index -- ",index)
            let x = CGFloat(index) * width
            view.frame = CGRect(x: x, y: y, width: width, height: height)
            index = index + 1
            
        }
        
    }
    
    /**
     处理tabBar子控件的事件响应
     */
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //        if point.y < 0 && point.x >= SCREEN_WIDTH / 5 * 2 && point.x <= SCREEN_WIDTH / 5 * 3 {
        //            return addButton
        //        }
        return super.hitTest(point, with: event)
    }
    
    // MARK: - 懒加载
    /// 中间 + 号按钮
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(named: "tabbar_publish_icon_normal"), for: UIControlState())
        addButton.setImage(UIImage(named: "tabbar_publish_icon_selected"), for: .highlighted)
        addButton.size = CGSize(width: SCREEN_WIDTH / 5, height: SCREEN_WIDTH / 5)
        addButton.center = CGPoint(x: SCREEN_WIDTH * 0.5, y: 49 * 0.5 - 8)
        addButton.addTarget(self, action: #selector(didTappedAddButton(_:)), for: .touchUpInside)
        return addButton
    }()
    
    
    
}
