//
//  StructTest.swift
//  Brother
//
//  Created by zhang on 15/11/26.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit



struct zhang<T> {
    
    var name = "zhang"
    var age = 23
    var gender:T?

    init(genderIn:T) {
        print("进来了")
        name = "zhangxianqiang"
        age = 25
        gender = genderIn
    }
}


enum Marry <Male,Female> {
    
    typealias SerializedObjectMale = Male
    
    /// The type of error to be created by this `ResponseSerializer` if serialization fails.
    typealias ErrorObjectFemale = Female
    
    case zhang(SerializedObjectMale)
    
    case han(ErrorObjectFemale) //这个后面其实是类型
    //    let request:NSURLRequest? //枚举里面不能有 任何的存储类型..
    internal var isSuccess: Bool {
        
        switch self {
            
        case .zhang:
            
            return true
        case .han:
            
            return false
        }
    }
}

class StructTest {
    
    var a = 1
    
    var b : Int  {
        return 2
    }
    
//    class func test() {
//        print(b) //看来类方法里面确定了是这个 数值类型也不行...
//    }
    func test() {
        
        print("struct Strat")
        
        let zhangxianqiang = zhang<String>(genderIn: "男")
        
        print(zhangxianqiang.age)
        print(zhangxianqiang.name)
        print(zhangxianqiang.gender)

        print("struct End")
        
    }
    
    
}
