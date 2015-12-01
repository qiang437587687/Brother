//
//  GenericsTest.swift
//  Brother
//
//  Created by zhang on 15/11/26.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

struct TStack<T> { //范型版本的结构体 (注意这个里面是有函数的 而且里面还要有对应的mutating 来修饰)
    
    var items = [T]()
    
    mutating func push(item:T) {
        items.append(item)
    }
    
    mutating func pop() {
        items.removeLast()
    }
}

extension TStack {
    
/// #### 这个地方到底 遇到问题了  1.extension 里面不能用实体变量吗??下面怎么能用呢?? 2 下面的方法是什么意思啊 直接后面就一个 {}
    
    //~~~~ 问题1 的答案 是extension里面不能用存储属性不能用计算属性.
    //~~~~ 问题2 的大拿 这个是因为set get 方法中如果不需要set方法那么就可以直接省略了set
    
    /*
    var topItem: T? {
        get {
            return items.isEmpty ? nil : items[items.count - 1]
        }
    }
    */
    
    
//    var topItem: T? = items.isEmpty ? nil : items[items.count - 1] //这个用到的是存储属性方法
    
    var topItem: T? { //这个用到的是计算属性  //这个地方还是有点不理解.
            return items.isEmpty ? nil : items[items.count - 1]
    }

}

class GenericsTest {
    
    private var a = "2"
    
    internal var b = 3 //
    
    internal var c = 2
    
    var d = 4
    
    var e = 5
    
    func swapTwoValuesTesttttt<T>(inout a: T, inout b:T) {
        let temp = a
        a = b
        b = temp
    }
    //
    /**
    知识点: 下面看一下 _ 对函数起的一些作用 (这个_ 是代表这个有默认值的 那么可以不写这个变量也就是说 addTwoValueTest1(1)可以这样调用的
    */
    func addTwoValueTest1(a:Int ,  _ b: Int = 3) { //这个地方貌似inout 并不能用来忽略吧 这个可是一个地址哦
       print(a+b)
    }

   /**
     class func test() {}
     知识点: 这个是类方法的话那么就意味着这里面的那些实例变量都是不能用的了~ a b c d e (这个可能是属性的问题~~!!!再研究一下)
    */
    func test() {
        
        print("GenericsTest Start")
    /**
        swapTwoValuesTesttttt(&a,&b)
        知识点: Extra argument in call 如果出现了这个错误说明类型不对
    */
        swapTwoValuesTesttttt(&d, b: &e)
        
        print(d)
      
        self.addTwoValueTest1(1)
        
    /**
     知识点: 声明一个范型的结构体变量,这里面的 <String> 是不能省略的
    */
        var stackOfStrings = TStack<String>()
        
        stackOfStrings.push("one")
        stackOfStrings.push("two")
        stackOfStrings.pop()
        print(stackOfStrings)
        
        print("GenericsTest End")

    }
}












