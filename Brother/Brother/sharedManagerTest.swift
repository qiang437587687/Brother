//
//  sharedManagerTest.swift
//  Brother
//
//  Created by zhang on 15/12/8.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

private let sharedInstance = sharedManagerTest()

class sharedManagerTest {
    
    
//    class var zhang:sharedManagerTest { //这样写的单例是错误的 就是想试验一下这个是 计算属性 那么 直接return
//     
//        return sharedManagerTest()
//    }
    
    class var sharedManager:sharedManagerTest { //这样的属于OC翻译版本  (版本1)
        
        struct Static {  //如果是1.2之前的swift并不支持存储类型的类属性那么需要一个struct来存储变量
            static var onceToken : dispatch_once_t = 0
            static var staticInstance : sharedManagerTest? = nil
        }
        
//        dispatch_once(&Static.onceToken) {
//            
//        }

        dispatch_once(&Static.onceToken) { () -> Void in
            Static.staticInstance = sharedManagerTest()
        }
    
        return Static.staticInstance!
    }
    
    class var sharedManager1:sharedManagerTest { //(版本2)
       
        struct Static { //上面的dispath_once 其实 swift 中可以用let 属性来保证线程安全. 那么就可以简化到线面的方法
            
            static let sharedInstance : sharedManagerTest = sharedManagerTest()
        }
        
        return Static.sharedInstance
    }
    
    
    class var  sharedManager2:sharedManagerTest { //(版本3)  这个和最上面的 private 那个实例一起使用 这个应该是这么理解吧:1.private 限制在这个类里面使用  2. 返回的总是哪个已经执行好的变量
        
        return sharedInstance
    }
    
}

class MyManager {
    
    static let sharedInstance = MyManager() //注意这个不仅仅是把上面的(版本3)全局拿出来了 注意这个里面是static上面的是private swift 2.0 上面说这个类方法在初始化的时候会被包装在一次的 swift_once_block_invoke 中以保证它的独一无二性.
    
    private init() {} //这个是用来覆盖公开的初始化方法 让项目中的其他地方不能通过init方法来生成制剂的MyManger也保证了单例的唯一性但是如果需要类似defaultManager形式的单例那么可以起吊init方法
}


/* 照抄一点关于单例的解释

你可能会有疑问：为何看不到dispatch_once？根据Apple Swift博客中的说法，以上方法都自动满足dispatch_once规则。这里有个帖子可以证明dispatch_once规则一直在起作用。

“全局变量（还有结构体和枚举体的静态成员）的Lazy初始化方法会在其被访问的时候调用一次。类似于调用'dispatch_once'以保证其初始化的原子性。这样就有了一种很酷的'单次调用'方式：只声明一个全局变量和私有的初始化方法即可。”--来自Apple's Swift Blog

（“The lazy initializer for a global variable (also for static members of structs and enums) is run the first time that global is accessed, and is launched as `dispatch_once` to make sure that the initialization is atomic. This enables a cool way to use `dispatch_once` in your code: just declare a global variable with an initializer and mark it private.”）

这就是Apple官方文档给我们的所有信息，但这些已经足够证明全局变量和结构体／枚举体的静态成员是支持”dispatch_once”特性的。现在，我们相信使用全局变量来“懒包装”单例的初始化方法到dispatch_once代码块中是100%安全的。但是对于静态类变量来说，情况又如何？

*/


