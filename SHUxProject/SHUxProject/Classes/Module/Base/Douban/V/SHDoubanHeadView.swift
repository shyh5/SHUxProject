//
//  SHDoubanHeadView.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/9.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHDoubanHeadView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadUI()
    }
    
    func loadUI() {
        self.backgroundColor = kOrangeColor
        self.addSubview(titleLabel)
        self.addSubview(backView)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.right.equalTo(-15)
            $0.bottom.equalTo(backView.snp.top)
            $0.height.equalTo(50)
        }
        
        backView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(50)
        }
        
    }
    
    
    fileprivate
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "豆瓣TOP250"
        // label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    //轨道背景
    fileprivate
    lazy var backView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        return view
    }()
    

}
