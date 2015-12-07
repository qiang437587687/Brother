//
//  animationViewController.swift
//  Brother
//
//  Created by zhang on 15/12/7.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

//一个填充的绿色方块
class MyCanvas: UIView {
    override func drawRect(rect: CGRect) {
        
        UIColor.greenColor().setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
    
    }
    
}

class MyCanves1:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //把背景设置成为透明的
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder : NSCoder) { //!!!! 这个是做什么的 并不知道 http://www.hangge.com/blog/cache/detail_938.html 这个可能还需要在看看别的地方的用法.
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let pathRect = CGRectInset(self.bounds, 1, 1)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        path.lineWidth = 3
        UIColor.greenColor().setFill()
        UIColor.blueColor().setStroke()
        path.fill()
        path.stroke()
    }
}

class MyCanves2:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //把背景设置成为透明的
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let  bezierPath = UIBezierPath()
        //创建一个rect 所有的边都内缩百分之5  后面的两个参数 正的是缩小 负的是增大
        let drawingRect = CGRectInset(self.bounds, self.bounds.size.width * 0.05, self.bounds.size.height * 0.05)
        
        let topLeft = CGPointMake(CGRectGetMinX(drawingRect), CGRectGetMinY(drawingRect))
        
        let topRight = CGPointMake(CGRectGetMaxX(drawingRect),
            CGRectGetMinY(drawingRect))
        
        let bottomRight = CGPointMake(CGRectGetMaxX(drawingRect),
            CGRectGetMaxY(drawingRect))
        
        let bottomLeft = CGPointMake(CGRectGetMinX(drawingRect),
            CGRectGetMaxY(drawingRect))
        
        let center = CGPointMake(CGRectGetMidX(drawingRect),
            CGRectGetMidY(drawingRect))
       
        bezierPath.moveToPoint(topLeft)
        bezierPath.addLineToPoint(topRight)
        bezierPath.addLineToPoint(bottomLeft)
//        bezierPath.addCurveToPoint(bottomRight, controlPoint1: center, controlPoint2: center)
        bezierPath.addQuadCurveToPoint(bottomRight, controlPoint: center)
        //使路径闭合，结束绘制
        bezierPath.closePath()
        
        //设定颜色，并绘制它们
        UIColor.greenColor().setFill()
        UIColor.blackColor().setStroke()
        
        bezierPath.fill()
        bezierPath.stroke()
        
    }
    
}


class MyCanves3:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //把背景设置成为透明的
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let bezierPath = UIBezierPath()
        
        let squareRect = CGRectInset(self.bounds, self.bounds.size.width * 0.05, self.bounds.size.height * 0.45)
        
        let circleRect = CGRectInset(self.bounds, self.bounds.size.width * 0.15, self.bounds.size.height * 0.3)
        
        let circlePath = UIBezierPath(ovalInRect: circleRect)//在rect中创建一个 椭圆形(当然rect是正方形这个就是圆形)
        let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 20)
        
        squarePath.appendPath(circlePath)
        bezierPath.appendPath(squarePath)
        
        UIColor.greenColor().setFill()
        UIColor.blackColor().setStroke()
        
        bezierPath.fill()
        bezierPath.stroke()
        
        
        
    }
}

class MyCanvasCircle : UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //把背景设置成为透明的
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let bezierPath = UIBezierPath()
        
        let drawingInRect = CGRectInset(self.bounds, 1, 1)
        
        let topLeft = CGPointMake(CGRectGetMinX(drawingInRect), CGRectGetMinY(drawingInRect))
        
        let toPoint = CGPointMake(CGRectGetMaxX(drawingInRect),
            CGRectGetMinY(drawingInRect))
        
        let center = CGPointMake(CGRectGetMidX(drawingInRect),
            CGRectGetMidY(drawingInRect))
        
        bezierPath.moveToPoint(topLeft)
//        bezierPath.addCurveToPoint(center, controlPoint1: center, controlPoint2: center)
        bezierPath.addQuadCurveToPoint(toPoint, controlPoint: center)

        bezierPath.closePath()
        
        //设定颜色，并绘制它们
        UIColor.greenColor().setFill()
        UIColor.blackColor().setStroke()
        
        bezierPath.fill()
        bezierPath.stroke()
    }
    
}

class bezierPath:UIViewController {

    func MyCanvasLv() -> MyCanvas {
        let viewRect = CGRect(x: 50, y: 50, width: 100, height: 100)
        let view1 = MyCanvas(frame:viewRect)
        self.view .addSubview(view1)
        return view1
    }
    
    func MyCanvasRadius() -> MyCanves1 {
        let viewRect = CGRect(x: 50, y: 160, width: 100, height: 100)

        let view1 = MyCanves1(frame:viewRect)
        
        self.view .addSubview(view1)
        return view1
    }
    
    func MyCanvasLetf() -> MyCanves2 { //创建一个图形
        let viewRect = CGRect(x: 50, y: 160, width: 100, height: 100)
        
        let view1 = MyCanves2(frame:viewRect)
        
        self.view .addSubview(view1)
        return view1
    }
    
    func MyCanvasRight() -> MyCanves3 { //创建一个图形
        let viewRect = CGRect(x: 50, y: 160, width: 100, height: 100)
        
        let view1 = MyCanves3(frame:viewRect)
        
        self.view .addSubview(view1)
        return view1
    }

    func MyCanvasMyCircle() -> MyCanvasCircle { //创建一个图形
        let viewRect = CGRect(x: 50, y: 160, width: 100, height: 100)
        
        let view1 = MyCanvasCircle(frame:viewRect)
        
        self.view .addSubview(view1)
        return view1
    }

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        print("animation View Test Start")

//        MyCanvasLv() //创建一个绿色的方块
        
//        MyCanvasRadius()
        
//        MyCanvasLetf()
        
//        MyCanvasRight()
        
        MyCanvasMyCircle()
        
        
        print("animation View Test End")
    
    }
    
}
