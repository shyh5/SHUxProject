//
//  SHSliderView.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/8.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHSliderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadUI()
    }
    
    func loadUI() {
        self.backgroundColor = UIColor.white
        
        self.addSubview(scoreLabel)
        self.addSubview(bubbleImage)
        self.addSubview(bubbleLabel)
        self.addSubview(dotImage)
        self.addSubview(tapView)
        tapView.addSubview(backView)
        tapView.addSubview(trackView)
        self.addSubview(thumb)
        
        
        
        
    }
    
    
    
    //MARK: -- subview --

    //气泡图片
    fileprivate
    lazy var bubbleImage : UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "alert_teacherEva_bubbleImage"))
        image.frame = CGRect.init(x: self.bounds.size.width - 70 , y:0, width: 74, height: 35)
        return image
    }()
    
    //气泡显示
    fileprivate
    lazy var bubbleLabel: UILabel = {
        let label  = UILabel()
        label.frame = CGRect.init(x: self.bounds.size.width - 71 , y:0, width: 74, height: 30)
        label.text = "10"
       // label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    //气泡箭头
    fileprivate
    lazy var dotImage : UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "alert_teacherEva_arrowImage"))
        image.frame = CGRect.init(x: self.bounds.size.width - 17.5 , y:26, width: 13, height: 13)
        return image
    }()
    
    //轨迹可点击视图（只要是为了增加视图的可点击面积）
    fileprivate
    lazy var tapView : UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.cyan
        view.frame = CGRect.init(x: 0, y: 34, width: self.bounds.size.width , height: 20)
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleTap(_:))))
        
        return view
    }()
    
    //轨道背景
    fileprivate
    lazy var backView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorWithHexString("#F3F3F3")
        view.frame = CGRect.init(x: 0, y: 6, width: self.bounds.size.width , height: 8)
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.cyan.cgColor
        view.layer.masksToBounds = true
        return view
    }()
    
    //轨道前景
    fileprivate
    lazy var trackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
//        view.frame = CGRect.init(x: 1.5, y: 9, width: self.bounds.size.width - 3, height: 2)
//        view.layer.cornerRadius = 1.0
        view.frame = CGRect.init(x: 1.5, y: 6, width: self.bounds.size.width - 3, height: 8)
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = true
        return view
    }()
    
    //滑块
    fileprivate
    lazy var thumb : UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "alert_teacherEva_sliderImg"))
        image.frame = CGRect.init(x: self.bounds.size.width - 20 , y:34, width: 20, height: 20)
        image.isUserInteractionEnabled = true
        image.contentMode = .center
        image.addGestureRecognizer(UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(_:))))
        return image
    }()
    
    fileprivate
    lazy var scoreLabel : UILabel = {
        let label = UILabel()
        label.frame = CGRect.init(x: 10 , y:self.thumb.frame.maxY + 5, width: self.bounds.size.width - 20, height: 13)
        label.text = "非常满意"
        // label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    @objc
    fileprivate func handleTap(_ tap: UITapGestureRecognizer) {
        reloadViewWithThumbCeneterX(tap.location(in: self).x)
    }
    
    @objc
    fileprivate func handlePan(_ pan: UIPanGestureRecognizer) {
        //获取偏移量
        let moveX = pan.translation(in: self).x
        
        //重置偏移量,避免下次取到的是原基础的增量
        pan.setTranslation(CGPoint.init(x: 0, y: 0), in: self)
        
        var centerX = moveX + thumb.center.x
        if centerX < 10 {
            centerX = 10
        }
        
        if centerX > self.bounds.size.width - 10 {
            centerX = self.bounds.size.width - 10
        }
        
        
        //刷新视图
        reloadViewWithThumbCeneterX(centerX)
    }
    
    //更改布局的方法
    fileprivate
    func reloadViewWithThumbCeneterX(_ thumbCeneterX: CGFloat) {
        print("thumbX:",thumbCeneterX)
        trackView.width = thumbCeneterX
        
        thumb.center.x = thumbCeneterX
        
        if thumb.center.x < 10 {
            thumb.center.x = 10
        } else if ( thumb.center.x > self.bounds.size.width - 10 ) {
            thumb.center.x = self.bounds.size.width - 10
        }
    
        dotImage.center.x = thumbCeneterX
        
        
        //更新气泡标签的位置 （气泡图片的宽度是74， 实际内容宽度66）
        bubbleImage.center.x = thumbCeneterX
        if bubbleImage.center.x < 33 {
            bubbleImage.center.x = 33
        }else if bubbleImage.center.x > self.bounds.size.width - 33 {
            bubbleImage.center.x = self.bounds.size.width - 33
        }
        
        bubbleLabel.center.x = bubbleImage.center.x
        
        let score = round(thumbCeneterX / self.bounds.size.width * 10)
        bubbleLabel.text = "\(score)"
        
        if score <= 3 {
            scoreLabel.text = "极其不满意"
        } else if score <= 5 {
            scoreLabel.text = "不满意"
        } else if score <= 7 {
            scoreLabel.text = "一般"
        } else if score <= 9 {
            scoreLabel.text = "满意"
        } else if score == 10 {
            scoreLabel.text = "非常满意"
        }
        
        
        
        
    }
    
}
