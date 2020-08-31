//
//  CalculatorBrain.swift
//  swiftUIdemo1
//
//  Created by Admin on 2020/8/28.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

//依次输入左侧数字，操作符，右侧数字
enum CalculatorBrain {
    case left(String)
    case leftOp(
        left:String,
        op:CalcultorUnitEnum.Operation
    )
    case leftOpRight(
        left:String,
        op:CalcultorUnitEnum.Operation,
        right:String
    )
    case error
    
    
    //定义一个数字格式化工具
    var numFrommatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        formatter.numberStyle = .decimal
        return formatter
    }
    
    
//   最上面显示的输入内容
    var output: String {
        let result : String
        switch self {
        case .left(let num):
             result = num
        case .leftOp(left: let num, _):
            result = num
        case .leftOpRight(_, _, right: let num):
            result = num
        case .error:
            result = "Error"
        }
        
        guard let value = Double(result) else {
            return "Error"
        }
        
        return numFrommatter.string(from: value as NSNumber)!
    }
    
    func apply(item:CalcultorUnitEnum) -> CalculatorBrain {
        return .left("")
    }
}

extension CalculatorBrain {
    
}


//调度器
typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction =  CalcultorUnitEnum
struct CalculatorReducer {
    static func reduce(
        state:CalculatorState,
        action:CalculatorStateAction
    ) -> CalculatorState {
        return state.apply(item: action)
    }
}
