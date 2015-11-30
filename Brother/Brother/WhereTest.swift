//
//  WhereTest.swift
//  Brother
//
//  Created by zhang on 15/11/30.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

class WhereTest {
    
    var numerA = 2
    
    func test() {
        
        print("WhereTest Start")
        
        let name = ["张宪强","韩修娟","王昊","费天尧"]
        
        name.forEach { (aName) -> () in
            switch aName {
            case let aName where aName.hasPrefix("张") :
                print("zhang")
            default:
                print("han")
            }
        }
        
        
        name.forEach {
            
            switch $0 {
            case let x where x.hasPrefix("张"):
                print("zhang+")
            
            default:
                print("你好，\($0)")
            }
            
            }
        
//            switch $0 {
//            case $0 where $0.hasPrefix("王"):
//                print("\($0)是笔者本家")
//            default:
//                print("你好，\($0)")
//            }
//        }
        
        let num:[Int?] = [98,97,nil]
        
        for score in num where score > 60 {
  
               /**
     知识点: 这个地方添加上  ! 之后呢 输出显示是这样的 及格啦98 如果不加上这个输出是这样的 及格啦Optional(98)
    */
            print("及格啦\(score)")
        }
    
        print("WhereTest End")
        
    }
    
}