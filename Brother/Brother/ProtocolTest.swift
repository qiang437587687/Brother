//
//  ProtocolTest.swift
//  Brother
//
//  Created by zhang on 15/11/27.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

protocol FullName {
    var fullName : String {get} //协议里面有一个变量的~
}

struct Person : FullName {

    var fullName:String

}

protocol Someprotocol {
    
       /**
     知识点: 在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字作为前缀 (这个还没太遇到过,等遇到了要好好看看 那个class 是怎么用的)
    */
    
    static func sonTypeProtocol()
    
       /**
     知识点: 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
    */
    
    mutating func somTypeProrocol()
}


struct point {
    var x = 0 , y = 0
       /**
     知识点: mutating 的用法和理解
     虽然结构体和枚举可以定义自己的方法，但是默认情况下，实例方法中是不可以修改 值类型 的属性.
    */
    mutating func moveXby(x:Int,yBy y :Int) {
        self.x = x
        self.y = y
        
        self = point(x: 2, y: 4) //加上mutating 还能修改自身的一些东西
    }
    
}



protocol RandomNumberGenerator {
    func random() -> Double
}

class LinerCong:RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
    
}


class ProtocolTest {
    
    func test() -> Void {
        
        print("ProtocolTest Start")
        
        let john = Person(fullName: "john Ass") //满足条件就要去实现一下.
        
        print(john.fullName)
        
        let generator = LinerCong()
        
        print(generator.random())
        
        print(generator.random())
        
        print("ProtocolTest End")
    }
    
}