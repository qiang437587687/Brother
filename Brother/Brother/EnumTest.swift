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

public enum BarCodeWithType<Value,Error:ErrorType> {
    
    case Success(Value)
    case Failure(Error)
    
}

indirect enum ADDAction { // indirect这个参数代表这个枚举能够进行递归搞作. 也能只是加载 case 的其中一个项目中.
    
    case Number(Int)
    case Add(ADDAction,ADDAction)
    case Multiplication(ADDAction,ADDAction)

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
        
        let possiblePlanet = Plent(rawValue: 2)
        let possiblePlanet1 = Plent(rawValue: 10)
        
        print(possiblePlanet) //Optional(Brother.Plent.Venus)
        print(possiblePlanet!) //Venus
        print(possiblePlanet1) //nil
//        print(possiblePlanet1!) //崩溃
        
        let five = ADDAction.Number(5) //一个小的递归例子
        let four = ADDAction.Number(4)
        let sum = ADDAction.Add(five, four)
        let product = ADDAction.Multiplication(sum, ADDAction.Number(2))
        
        func evalute(expression : ADDAction) -> Int {
            switch expression {
            case .Number(let value):
                return value
            case .Add(let left, let right):
                return evalute(left) + evalute(right)
            case .Multiplication(let left, let right):
                return evalute(left) * evalute(right)
            }
            
        }
        print(evalute(product))
        
//        public let result: Result<Value, Error>
        //BarCodeWithType  test
        //public let result: Result<Value, Error>
//        let enmuType = BarCodeWithType.Success("string") //这块还是没弄明白~ Fuck
//        let enmuTypee = BarCodeWithType.Failure(nil)
//        
        
        print("enum test end")

    }
    
}