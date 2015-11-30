//
//  MoreOptional.swift
//  Brother
//
//  Created by zhang on 15/11/30.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation

class MoreOptional {
    
    func test() {
        
        var string : String? = "string"
        
        //下面的这两个是等效的~
        var anotherString : String?? = string
        var literalOptional : String?? = "string"
        
        
        var aNil : String? = nil
        //下面这两个是不等效的~
        var anotherNil : String?? = aNil
        var literalNil : String?? = nil
        
        //下面这个是 在lldb 控制台中 打印的信息 fr v -R anotherNil 其中 anotherNil = Some  literalNil = None
        /*
        
        fr v -R anotherNil
        (Swift.Optional<Swift.Optional<Swift.String>>) anotherNil = Some {
        Some = None {
        Some = {
        _core = {
        _baseAddress = {
        _rawValue = 0x0000000000000000
        }
        _countAndFlags = {
        value = 0
        }
        _owner = None {
        Some = {
        instance_type = 0x0000000000000000
        }
        }
        }
        }
        }
        }

        
        
        fr v -R literalNil
        (Swift.Optional<Swift.Optional<Swift.String>>) literalNil = None {
        Some = Some {
        Some = {
        _core = {
        _baseAddress = {
        _rawValue = 0x0000000000000000
        }
        _countAndFlags = {
        value = 0
        }
        _owner = None {
        Some = {
        instance_type = 0x0000000000000000
        }
        }
        }
        }
        }
        }
        
        
        */
        
    }
    
}