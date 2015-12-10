//
//  CAAnimationTest.swift
//  Brother
//
//  Created by zhang on 15/12/10.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

class CAAnimationTest: UIViewController {
    var viewAnimation:UIView = UIView()

    @IBAction func controllerButton(sender: UIButton) {
        
        let  pausedTime:CFTimeInterval = viewAnimation.layer.timeOffset
        viewAnimation.layer.speed = 1.0
        viewAnimation.layer.timeOffset = pausedTime

        let timeSincePause = viewAnimation.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        viewAnimation.layer.beginTime = timeSincePause
    }
    
    @IBAction func endButton(sender: UIButton, forEvent event: UIEvent) {
        //暂停动画
        viewAnimation.layer.timeOffset = viewAnimation.layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        viewAnimation.layer.speed = 0.0
    }
    
    override func viewDidLoad() { //别同时运行一个一个的实验
//        addAnimation() //圆圈动画
//        keyrameAnimation() //关键帧动画
        sharkAnimation()//抖动动画
    }
    
    func sharkAnimation() {
    
        viewAnimation = UIView(frame: CGRectMake(100, 100, 100, 100))
        viewAnimation.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(viewAnimation)
        
        let labelHE = UILabel(frame: CGRectMake(0,35,100,30))
        labelHE.text = "和尚"
        labelHE.textAlignment = NSTextAlignment.Center
        viewAnimation.addSubview(labelHE)
        
        let kfAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        kfAnimation.duration = 0.1
        kfAnimation.repeatCount=MAXFLOAT;
        kfAnimation.fillMode=kCAFillModeForwards;
        kfAnimation.removedOnCompletion = false;
        
//        29     keyAnima.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
        kfAnimation.values = [-angleTransfrom(4),angleTransfrom(4),-angleTransfrom(4)]
        self.viewAnimation.layer.addAnimation(kfAnimation, forKey:"sharkAnimation")
    
    }
    
    func angleTransfrom(angelOr:Double) -> Double {
        
        return angelOr / 180 * M_PI
    }
    
    func keyrameAnimation() {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        viewAnimation = UIView(frame: CGRectMake(100, 100, 100, 100))
        viewAnimation.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(viewAnimation)

        //设置5个位置点
        let p1 = CGPointMake(0.0, 0.0)
        let p2 = CGPointMake(300, 0.0)
        let p3 = CGPointMake(0.0, 400)
        let p4 = CGPointMake(300, 400)
        let p5 = CGPointMake(150, 200)
         
        //赋值
        animation.values = [NSValue(CGPoint: p1), NSValue(CGPoint: p2),
             NSValue(CGPoint: p3), NSValue(CGPoint: p4), NSValue(CGPoint: p5)]
         
        //每个动作的时间百分比
        animation.keyTimes = [NSNumber(float: 0.0), NSNumber(float: 0.4),
              NSNumber(float: 0.6), NSNumber(float: 0.8), NSNumber(float: 1.0), ]
         
        animation.delegate = self
        animation.duration = 6.0
        animation.autoreverses = true //这个就看需不需要了 这里面先是false
        animation.repeatCount = Float(INT_MAX)

        viewAnimation.layer.addAnimation(animation, forKey: "Image-Move")
    }
    
    func addAnimation() { //小圆点 变大变小动画
        
        viewAnimation = UIView(frame: CGRectMake(100, 100, 100, 100))
        viewAnimation.layer.cornerRadius = viewAnimation.frame.size.width/2
        viewAnimation.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(viewAnimation)
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 3.0
        animation.repeatCount = Float(INT_MAX)
        animation.autoreverses = true //这个就看需不需要了
        
        let animationFrame = CABasicAnimation(keyPath: "bounds")
        animationFrame.duration = 3.0
        animationFrame.fromValue =  NSValue(CGRect: CGRectMake(0, 0, 100, 100))
        animationFrame.toValue = NSValue(CGRect: CGRectMake(0, 0, 20, 20))
        animationFrame.repeatCount = Float(INT_MAX)
        animationFrame.autoreverses = true
        
        let animationCornerRadius = CABasicAnimation(keyPath: "cornerRadius")
        animationCornerRadius.duration = 3.0
        animationCornerRadius.fromValue =  50
        animationCornerRadius.toValue = 10
        animationCornerRadius.repeatCount = Float(INT_MAX)
        animationCornerRadius.autoreverses = true
        
        viewAnimation.layer.addAnimation(animationCornerRadius, forKey: "Image-animationCornerRadius")
        viewAnimation.layer.addAnimation(animationFrame, forKey: "Image-frame")
        viewAnimation.layer.addAnimation(animation, forKey: "Image-opacity")
        viewAnimation.alpha = 0
        
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("动画开始")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }

}
























