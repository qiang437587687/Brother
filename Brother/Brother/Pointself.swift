//
//  Pointself.swift
//  Brother
//
//  Created by zhang on 15/11/30.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

class pointIn {
    var numberA = 4
    class func testNumber() {
        print("in there")
    }
    func testnumberA() {
        print(numberA)
    }
}

class PointSelf {
    
    func test() {
        
        let typeB = pointIn()
        print(typeB.numberA)
        
        let typeA =  pointIn.self // 这里面就是简单地试验一下.self
//        print((typeA as? pointIn)!.numberA) //这样是不行的 因为这个是一个 pointIn.type 强转 pointIn类型一定不会成功的
//        print(typeA.numberA)
        
        if  typeA is pointIn.Type { //这个是正确的
            print("isssss")
        } else {
            print("sorry")
        }
        
        typeA.testNumber() //能直接使用类方法
//        typeA.testnumberA(typeB) //不能这么直接使用实例方法.具体怎么用我还真的是没有探究~(不会😂)
    }
    
}