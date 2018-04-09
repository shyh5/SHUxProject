//
//  SHHomeViewController.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/8.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slider = SHSliderView.init(frame: CGRect.init(x: 10, y: 100, width: 300, height: 75))
        view.addSubview(slider)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
