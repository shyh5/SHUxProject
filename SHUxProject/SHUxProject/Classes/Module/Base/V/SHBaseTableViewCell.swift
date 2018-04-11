//
//  SHBaseTableViewCell.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/9.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHBaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configUI()
    }
    
    open func configUI() {}
    

}
