//
//  ProtocolTest.swift
//  Brother
//
//  Created by zhang on 15/11/27.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

protocol FullName {
    var fullName : String {get} //协议里面有一个变量的~
}

struct Person : FullName {

    var fullName:String

}

protocol Someprotocol {
    
       /**
     知识点: 在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字作为前缀 (这个还没太遇到过,等遇到了要好好看看 那个class 是怎么用的)
    */
    
    static func sonTypeProtocol()
    
       /**
     知识点: 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
    */
    
    mutating func somTypeProrocol()
}


struct point {
    var x = 0 , y = 0
       /**
     知识点: mutating 的用法和理解
     虽然结构体和枚举可以定义自己的方法，但是默认情况下，实例方法中是不可以修改 值类型 的属性.
    */
    mutating func moveXby(x:Int,yBy y :Int) {
        self.x = x
        self.y = y
        
        self = point(x: 2, y: 4) //加上mutating 还能修改自身的一些东西
    }
}


protocol MyProtocol {
    init(someParamter: Int)
}

class MyProtocolClass:MyProtocol {
    
        /**
     知识点:这个满足了这个协议那么 require 这个是必须加上的
     */
    required init(someParamter:Int) {
        
    }
}



protocol RandomNumberGenerator {
    func random() -> Double
}

class LinerCong:RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
    
}



class Dice {
    let sides: Int
        /**
     知识点:协议当做类型来来作为一个变量来使用
     */
    let  generator: RandomNumberGenerator
    init(sides: Int,generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        
            /**
     知识点:这个地方的强制转换不能是 as 只能是 Int(XXX) 的形式.
     */
        
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*--下面测试一下委托代理模式--*/

protocol DiceGame {
    
    var  dice: Dice { get } //这个里面是一个get 就表示满足这个协议的一个类在创建了这个dice以后就不能再修改这个dice了
    func play()
}

protocol DiceGameDelegate {
    
    func gameDidStart(game:DiceGame)
    func game(game: DiceGame,didStartNewTurnWithDiceRolldiceRoll:Int)
    func gameDidEnd(game:DiceGame)
}

class SnakeAndLadders : DiceGame {
    
    let finalSquare = 25
    let dice = Dice(sides:6, generator: LinerCong())
    
    var square = 0
    var board : [Int]
    
    var delegate: DiceGameDelegate?
    
    init(){
        board = [Int](count: finalSquare + 1, repeatedValue: 0) //这种也是初始化一个数据的过程
    }
    func play() {
        
        delegate?.gameDidStart(self)
        delegate?.game(self, didStartNewTurnWithDiceRolldiceRoll: square)
        delegate?.gameDidEnd(self)
    
    }

}

class DiceGameTracker:DiceGameDelegate {

    func gameDidStart(game: DiceGame) {
        
        //这个里面的类其实就是上面的那个类
       // game.dice = Dice() //好的这个地方果然就映证了上面的那个 {get} 其实真的是一个Read-Only类型的
        
        print("Game Start")
        
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRolldiceRoll: Int) {
        print("Gaming")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("Game End")
    }
}

    /**
     知识点:这个里面没有满足 DiceGameDelegate 但是可以通过Extnsion来满足delegate
     */

class DiceGameTrackerExtesion {
    func gameDidStart(game: DiceGame) {
        print("Game StartE")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRolldiceRoll: Int) {
        print("GamingE")
    }
}

extension DiceGameTrackerExtesion:DiceGameDelegate {
    
    func gameDidEnd(game: DiceGame) {
        print("Game EndE")
    }
    
}

    /**
     知识点:这个里面clss 是说明这个只能是 class 可以采纳的 struct 和 enum 都是不能采纳的.
     */
protocol SomeClassOnlyPrortocol: class,DiceGame {
    
}




class ProtocolTest {
    
    func test() -> Void {
        
        print("ProtocolTest Start")
        
        let john = Person(fullName: "john Ass") //满足条件就要去实现一下.
        
        print(john.fullName)
        
        let generator = LinerCong()
        
        print(generator.random())
        
        print(generator.random())
        
        let dice = Dice(sides: 6, generator: LinerCong())
        
        for _ in 1...5 {
            print("Random dice roll is \(dice.roll())")
        }
        
        //下面这个是平时使用的一个形式
        let tracker = DiceGameTracker()
        let game = SnakeAndLadders()
        game.delegate = tracker
        game.play()
        
        
        let trackerExtension = DiceGameTrackerExtesion()
        game.delegate = trackerExtension
        game.play()
        
            /**
     知识点:这个是表示celebrator是同事满足两个协议的`
     */
        func wishHappyBirthday(celebrator:protocol<DiceGame,DiceGameDelegate>) {
            
        }

        print("ProtocolTest End")
    }
    
}