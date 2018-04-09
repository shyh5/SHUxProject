//
//  UIViewExtension.swift
//  BaiSiBuDeJie-swift
//
//  Created by SHyH5 on 2017/8/30.
//  Copyright © 2017年 SHyH5. All rights reserved.
//


import Foundation
import UIKit

public enum Direction : Int {
    case horizontal  //水平抖动
    case vertical  //垂直抖动
}

extension UIView {
    
    /// 获取或设置 x
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// 获取或设置 y
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// 获取或设置 width
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// 获取或设置 height
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// 获取或设置 size
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    /// 获取或设置 origin
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    

    /**
     扩展UIView增加抖动方法
     
     @param direction：抖动方向（默认是水平方向）
     @param times：抖动次数（默认5次）
     @param interval：每次抖动时间（默认0.1秒）
     @param delta：抖动偏移量（默认2）
     @param completion：抖动动画结束后的回调
     */
    func shake(_ direction: Direction = .horizontal, times : Int = 5, interval : TimeInterval = 0.1, delta : CGFloat = 2,  completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: interval, animations: {
            switch direction {
            case .horizontal :
                self.layer.setAffineTransform(CGAffineTransform.init(translationX: delta, y: 0))
                
            case .vertical :
                self.layer.setAffineTransform(CGAffineTransform.init(translationX: 0, y: delta))
                
            }
        }, completion: { (finish) in
            //如果当前是最后一次抖动，则将位置还原，并调用完成回调函数
            if times == 0 {
                UIView.animate(withDuration:interval , animations: {
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                    
                }, completion: { (finish) in
                    completion?()
                })
            }else {
                //如果当前不是最后一次抖动，则继续播放动画（总次数减1，偏移位置变成相反的）
                self.shake(direction, times: times - 1, interval: interval , delta: delta * (-1), completion: completion)
            }
        })
    }
    
    
    
}
