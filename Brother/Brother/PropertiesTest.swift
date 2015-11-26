//
//  PropertiesTest.swift
//  Brother
//
//  Created by zhang on 15/11/26.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

/**
 知识点: 结构体是类型 如果里面用var 声明了一个变量, 当这个结构赋值给一个 let 的变量那么这里面的var变量也是不能修改的, 不过class 是引用类型这个就可以这么干(具体的例子 中文文档的Properties开始部分)
        这里面还弄明白了@lazy 属性的作用了其实也挺简单的就是使用的时候进行创建 但是这个lazy 是没有办法保证只创建一次的.
                     class DataImporter {
                        /*
                         DataImporter 是一个负责将外部文件中的数据导入的类。
                         这个类的初始化会消耗不少时间。
                         */
                         var fileName = "data.txt"
                         // 这里会提供数据导入功能
                     }
                     
                     class DataManager {
                         lazy var importer = DataImporter() //lazy~
                         var data = [String]()
                         // 这里会提供数据管理功能
                     }
                     
                     let manager = DataManager()
                     manager.data.append("Some data")
                     manager.data.append("Some more data")
                     // DataImporter 实例的 importer 属性还没有被创建
 */


//计算属性 我现在理解的就是 添加了对应的set get 方法的属性



class PropertiesTest {

    
    var a : Int = 1 // 这样就算是一个存储 属性了吧  这个里面能用willset 和didset 方法来检测
    
    var b : Int = 2
    
    var c : Int {   //这样就算是一个计算属性.
        
        set (val){
            self.b = val - a
        }
        get{
            return a + self.b
        }
    }
    
    var cc : Int { //上面的简写 可以是这样
        return a + b
    }
    
    
    var d : Int  = 0{
        
        willSet {
            print("\(newValue)新的值")
        }
        didSet {
            print("\(oldValue)旧的值")
            if d < 10 {
                d = 10
            } else {
                
            }
        }
        
    }
    
    
    func test() {
        
        
        print("Properties start")
        
        d = 9

        print(d)
        
//        c = 5
        print(b)
        c = 10
        print(b)
        
        print(c)
        
        print("Properties End")
        
    }
    
    
}
