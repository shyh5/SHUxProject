//
//  SHBaseCollectionViewCell.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/9.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHBaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
