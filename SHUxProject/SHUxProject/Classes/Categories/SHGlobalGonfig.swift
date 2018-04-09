//
//  SHGlobalGonfig.swift
//  podsTextSwift
//
//  Created by SHyH5 on 2017/9/1.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import Foundation
import UIKit

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


///通知的默认宏定义
let kPushAdv = "kPushAdv"

