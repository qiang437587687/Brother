//
//  ClosureTest.swift
//  Brother
//
//  Created by zhang on 15/11/25.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

class ClosureTest {

    
    func someFunction(NeedClosure:(s1 : String)->String) {
        //            print("in Func \(s1)")
        print(NeedClosure(s1: "han"))
        
    }
    
    
    class func test() {
        
        let name = ["Chris","Alex","Ewa","Barray","Daniella"]
        
        func backWards(s1:String,s2:String) -> Bool {
            return s1 < s2
        }
        
        func ClosureZhang(zhang:(String,String) -> Bool) {
            
        }
        
        print("closure Test Start")
        
        
        var reversed = name.sort(backWards) //直接表达式 各种闭包表达式
        
//        let reversed = name.sort(<#T##isOrderedBefore: (String, String) -> Bool##(String, String) -> Bool#>)
        reversed = name.sort({(s1:String,s2:String) -> Bool in return s1 > s2})
        
        reversed = name.sort({s1,s2 in return s1 > s2})
        
        reversed = name.sort({s1,s2 in s1 > s2})
        
        reversed = name.sort({$0>$1})
        
        reversed = name.sort(>)
        
        reversed = name.sort(){$0>$1} //尾随闭包
        
        reversed = name.sort{$0>$1} //尾随闭包
        
//        reversed = name.sort(){>} //这样写是不对的
        
        print(reversed)
        
        //使用闭包
        func someFunctionThatUseClosure(NeedClosure:(s1 : String)->String) {
//            print("in Func \(s1)") 
            print(NeedClosure(s1: "han"))
            
        }
        print("------")
        someFunctionThatUseClosure { (s1) -> String in
           
            print("some in \(s1)")
            
            return s1+"dabao"
        }
        
//        someFunctionThatUseClosure() { (s1) -> String in  //当闭包是最后一个参数的时候能拿出来(尾随闭包) 如果只有闭包这一个参数那么甚至可以吧()也去掉也就是上面的写法. 加油.
//            
//        }
        
        
        
        
        //下面测试一下colsure
        
        
        print("closure Test End")
    }
    
}










