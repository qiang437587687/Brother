//
//  EnumTest.swift
//  Brother
//
//  Created by zhang on 15/11/25.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

public enum BarCode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

public enum Plent:Int {
    case Mercury = 1,Venus,Earth  // 这里面就有了初始值  后面的 Venus 这个的值是2
    case Venuss
}

public enum BarCodeWithType<value,Error:ErrorType> {
    
    case Success(value)
    case Failure(Error)
    
}

class EnumTest {
    
    func test() -> Void {
        
        print("enum test start")
        
        var code : BarCode = BarCode.UPCA(1, 1, 1, 1)
        
        print(code)
        
        code = BarCode.QRCode("zhang")
        
        print(code)
        
        code = BarCode.UPCA(2, 2, 2, 2)
        
        print(code)
        
        
        let Plent1 : Plent = Plent.Venus
        let Plent2 : Plent = Plent.Venuss

        print(Plent1) // 隐式初始值为2
        print(Plent2)
        
        let earthOrder = Plent.Earth.rawValue
        print(earthOrder) //这样就能取出对应的初始值了
        
        
//        var codeTest : BarCodeWithType =
        
        
        print("enum test end")

    }
    
}