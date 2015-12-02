//
//  SubscriptTest.swift
//  Brother
//
//  Created by zhang on 15/12/2.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

struct SomeStruct {
    
    enum someEnum {
        case zhang,han,xiu
    }
    
//    var arr : Array<Double> = []
    
    var meals:[someEnum:String] = [:]
    
    subscript(requestMeal:someEnum) -> String? {
        
        get {
            
            if let old = meals[requestMeal] {
            
                return old
            }
            
            return "1234567890"
            
        }
        
        set {
            
            meals[requestMeal] = newValue
            
        }
        
    }
    
}


class SubscriptTest {
    
    func test() {
        
        print("SubscriptTest Start")
        
        var money = SomeStruct()
        
//        money.meals[SomeStruct.someEnum.zhang] = "zhang"
        money.meals[.zhang] = "zhang"

        if let moneyT = money.meals[.zhang] {
            print(moneyT)
        }
        
        //上面是没有用Subscript 的时候 是哟哦那个的方法 下面是使用了 Subscript 的方法
        
        if let moneyU = money[.zhang] {
            print(moneyU)
        }
        
        print("SubscriptTest End")
        
    }
    
}
