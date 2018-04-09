//
//  SHStringExtension.swift
//  OneShyh5
//
//  Created by SHyH5 on 2017/9/28.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import Foundation

extension String {

    //MARK:字符串类型是否为空
    func isNullString() -> Bool {
        let aimString = NSString.init(string: self)
        if aimString.length > 0 {
            return true
        }
        
        return false
    }
    
    // MARK: 汉字 -> 拼音
    func chineseToPinyin() -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        let pinyin = stringRef as String
        
        return pinyin
    }
    
    // MARK: 获取第一个字符
    func first() -> String {
        let index = self.index(self.startIndex, offsetBy: 1)
        return self.substring(to: index)
    }
    
    
}
