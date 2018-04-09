//
//  SHAdvViewController.swift
//  OneShyh5
//
//  Created by SHyH5 on 2017/11/30.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import UIKit

class SHAdvViewController: UIViewController {
    
    var webview : UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "广告"
        self.view.backgroundColor = UIColor.purple
        
        self.webview = UIWebView.init()
        self.webview?.frame = self.view.bounds
        self.webview?.backgroundColor = UIColor.yellow
        let url = URL.init(string: "http://www.baidu.com")
        let request = URLRequest.init(url: url!)
        self.webview?.loadRequest(request)
        self.view.addSubview(self.webview!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
