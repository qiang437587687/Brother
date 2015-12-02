//
//  JsonToModel.swift
//  Brother
//
//  Created by zhang on 15/12/2.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation


class JsonModelClass:NSObject {
    
    var zhang:String = "6"
    var han:String = "5"
    var qiang:String?
//    var xiuu:Array<JsonModelInArr>
    var xiu:NSArray = []
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("value = \(value) key = \(key)")
    }
    
}