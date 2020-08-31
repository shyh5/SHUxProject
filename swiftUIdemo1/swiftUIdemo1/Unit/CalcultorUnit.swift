//
//  CalcultorUnit.swift
//  swiftUIdemo1
//
//  Created by Admin on 2020/8/26.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
enum CalcultorUnitEnum {
    enum Operation : String {
        case add = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Common: String {
        case clear = "C"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digite(Int)//数字区
    case op(Operation)//基本运算列
    case common(Common)//第一行公共操作行
    case dot //小数点
}

//MARK: -- 声明这个协议为了能使用foreach 便利函数 --
extension CalcultorUnitEnum:Hashable {
    var title : String {
        switch self {
        case .dot:
            return "."
        case .digite(let value):
            return "\(value)"
        case .op(let operation):
            return operation.rawValue
        case .common(let common):
            return common.rawValue
        }
    }
    
    var size: CGSize {
        if case .digite(let value) = self, value == 0 {
            return CGSize.init(width: 88 * 2, height: 88)
        }
       return CGSize(width: 88, height: 88)
    }
    
    var bacgroundColorName: String {
        switch self {
        case .dot, .digite:
            return "deepBlueC"
        case .op:
            return "orangeC"
        case .common:
            return "blueC"
        }
    }
    
}


