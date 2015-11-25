//
//  HowToUse<>.swift
//  Brother
//
//  Created by zhang on 15/11/25.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit


public protocol ResponseSerializerType {
    /// The type of serialized object to be created by this `ResponseSerializerType`.
    typealias SerializedObject
    
    /// The type of error to be created by this `ResponseSerializer` if serialization fails.
    typealias ErrorObject: ErrorType
    
    /**
     A closure used by response handlers that takes a request, response, data and error and returns a result.
     */
    var serializeResponse: (NSURLRequest?, NSHTTPURLResponse?, NSData?, NSError?) -> Result<SerializedObject, ErrorObject> { get }
}




public enum Result<Value,Error:ErrorType> {
    
    case Success(Value)
    case Failure(Error)
    
    public var isSuccess:Bool {
        
        switch self {
        case .Success:
            return true
        case .Failure:
            return false
        }
        
    }
    
}

public struct Response<Value, Error: ErrorType> {
    
    public let request: NSURLRequest?
    
    public let response: NSHTTPURLResponse?
    
    public let data: NSData?
    
    public let result:Result<Value,Error>?
    
    public init(request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?,result:Result<Value,Error>?) {
        
        self.request = request
        
        self.response = response
        
        self.data = data
        
        self.result = result
    }
}


class HowToUseBracket {
    
    var array2 = Array<String>() // <这个里面其实是类型>
    
    
    internal func responseData(completionHandler: Response<NSData, NSError> -> Void) {
        print("response")
    }
    
    
    internal func response<T: ResponseSerializerType>(
        queue queue: dispatch_queue_t? = nil,
        responseSerializer: T,
        completionHandler: Response<T.SerializedObject, T.ErrorObject> -> Void)
        -> Self
    {
            dispatch_async(queue ?? dispatch_get_main_queue()) {
                
                let response = Response<T.SerializedObject, T.ErrorObject>(request: nil, response: nil, data: nil, result: nil)
                
                completionHandler(response)
            }
        
        return self
    }
    
    
    func test() -> () {
        
        print("开始测试")
        
        array2.append("1111")
        
        print(array2)
        
        self.responseData { (Response) -> Void in
            print("response1111")
        }
    
        print("结束测试")
        
    }
    
}