//
//  ExtensionTest.swift
//  Brother
//
//  Created by zhang on 15/11/27.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

   /**
     知识点: 这个里面看文档还是有很多不明白的地方 不能用存储属性等等这个再看看.
    */

extension Int {
    
    func repetitions(task:() -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
    
    mutating func square() {
        self = self * self
    }
    
}

class ExtensionTest {
    
    func test() -> Void {
        
        print("ExtensionTest Start")

        3.repetitions { () -> Void in
            print("Extension")
        }
        
        var a = 3
        
        a.square()
        
        print(a)
        
        print("ExtensionTest End")
    }
    
}
