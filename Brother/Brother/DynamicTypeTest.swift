//
//  DynamicTypeTest.swift
//  Brother
//
//  Created by zhang on 15/12/2.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation


protocol Copyable {
    func copy() -> Self
}

//protocol Copyablee {
//    func copy() -> self
//}

/*
class MyClsss:Copyable {
    var num = 0
    func copy() -> Self {
        let result = MyClsss()
        result.num = num
        return result       //这样的代码是错误的代码 提示是 不能把MyClss return to Self 这个很显然的 Self 代表一个类型 并不是一个实际的对象.
    }
}
*/
class MyClass:Copyable {
    
    var num = 0
    
    func copy() -> Self {
        let result = self.dynamicType.init() //这里生成的一个对象能保证和上下文(MyClass)无关又能只带当前类型的方式进行初始化.
        result.num = num
        return result
    }
    
    required init() { //如果不写这个会有一定的错误.
    
    }
}

class MtClass:Copyable {
    
    var num = 0
    
    func copy() -> Self {
        return self.dynamicType.init()
    }

    required init() { //如果不写这个会有一定的错误.
        
    }

}


class DynamicTypeTest {
    
    func test() {
        
        print("DynamicTypeTest Start")
        
        let date = NSDate()
        
        let name : AnyClass! = object_getClass(date) //这里面的 ! 它甚至可以表明可以输入一个nil 并期待着返回一个nil
        
        let name1 = date.dynamicType
        
        print(name)
        
        print(name1)
        
        let string = "string"
        
        let name2 = string.dynamicType
        
        print(name2)
        
        print("DynamicTypeTest End")
        
    }
    
}