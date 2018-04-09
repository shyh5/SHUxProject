//
//  SHAdvertView.swift
//  OneShyh5
//
//  Created by SHyH5 on 2017/11/30.
//  Copyright © 2017年 SHyH5. All rights reserved.
//

import UIKit
//import SDWebImage

//启动页广告
class SHAdvertView: UIView {

    ///广告路径
    public var filepath : String? {
        didSet {
//            if filepath != nil {
//                let url = URL.init(string: filepath!)
//
//                self.advImageView?.sd_setImage(with: url , placeholderImage: nil, options: .retryFailed, completed: { (image, error, cache, url) in
//
//                })
//            }
        }
    }
    
    ///显示图片
    var advImageView : UIImageView?
    ///倒计时按钮
    var countButton : UIButton?
    
    var  kShowTime  = 3       //显示时间
    
    ///定时器
//    fileprivate lazy var countTimer : Timer = {
//        let timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
//        return timer
//    }()
    
    var countTimer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(frame: CGRect ) {
        self.advImageView = UIImageView.init(frame: frame)
        self.advImageView?.isUserInteractionEnabled = true
        self.advImageView?.backgroundColor = UIColor.white
        self.advImageView?.clipsToBounds = true
        
        ///这个等正式环境测
        //self.advImageView?.contentMode = .scaleAspectFit
        self.addSubview(self.advImageView!)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapHideGesture(gesture:)))
        self.advImageView?.addGestureRecognizer(tapGesture)
        
        self.countButton = UIButton.init(type: .custom)
        self.countButton?.frame = CGRect.init(x: SCREEN_WIDTH - 60 - 24 , y: 30, width: 60, height: 30)
        self.countButton?.setTitle("跳过\(kShowTime)", for: .normal)
        self.countButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.countButton?.setTitleColor(UIColor.white, for: .normal)
        self.countButton?.addTarget(self, action: #selector(removeAdvertView), for: UIControlEvents.touchUpInside)
        self.countButton?.backgroundColor = UIColor.colorWithRGB(38, g: 38, b: 38)
        self.countButton?.layer.cornerRadius = 5
        self.addSubview(self.countButton!)
        
    }
    
    func startTime()  {
        if self.countTimer == nil{
            self.countTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        }
    }
    
    
    @objc
    fileprivate func countDown() {
        self.kShowTime = self.kShowTime - 1
        self.countButton?.setTitle("跳过\(self.kShowTime)", for: .normal)
        
        if self.kShowTime == 0 {
            self.removeAdvertView()
        }
    }
    
    /// push adv detail view
    @objc
    fileprivate func tapHideGesture(gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kPushAdv), object: nil)
    }
    
    ///remove adv view
    @objc
    fileprivate func removeAdvertView() {
        
        guard let time = self.countTimer else {
            return
        }
        time.invalidate()
      
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    /// show adv view
    public func show() {
        
        self.startTime()
        
        let  window = UIApplication.shared.keyWindow
        window?.addSubview(self)
        
//        let url = URL.init(string: filepath!)
//       // self.advImageView?.kf.setImage(with: ImageResource.init(downloadURL: url!))
//        self.advImageView?.kf.setImage(with: ImageResource.init(downloadURL: url!), placeholder: UIImage.init(named: "main_banner"), options: nil, progressBlock: { (pro, pro2) in
//
//        }, completionHandler: { (image, error, cache, url) in
//
//        })
        
    }
    

}
