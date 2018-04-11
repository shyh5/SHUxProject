//
//  SHChooseViewController.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/8.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit
import SnapKit

class SHChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUI()
    }
    
    func loadUI() {
        view.backgroundColor = UIColor.green
        view.addSubview(leftBtn)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: -- layout --
    fileprivate
    lazy var leftBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.init(x: 10, y: 100, width: 150, height: 45)
        btn.backgroundColor = UIColor.blue
        btn.setTitle("豆瓣TOP250", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.tag = 971
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    
    @objc
    fileprivate func btnClick(_ sender : AnyObject ) {
        self.navigationController?.pushViewController(SHDoubanTop250ViewController(), animated: true)
        
    }
    
    
    

    

}
