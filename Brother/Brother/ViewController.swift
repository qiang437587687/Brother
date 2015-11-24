//
//  ViewController.swift
//  Brother
//
//  Created by zhang on 15/11/24.
//  Copyright © 2015年 zhang. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

//这个是马上要请求的接口 http://api.youaiyihu.com/v5/workers
class ViewController: UIViewController {

    var Json : JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() -> () {
        
        Alamofire.request(.GET, "http://api.youaiyihu.com/v5/workers", parameters: nil).responseData { (Response) -> Void in
         
//            print(Response.description)//data 的 description
//            print(Response.result)
//            print(Response.data)
//            print(Response.request)
//            print(Response.response)
            
            
            self.Json = JSON(data:Response.data!) //这个地方接收的是data类型的数据 不能是json类型的么??
            let Arr = self.Json!["data"]["items"][0]["hospital_id"] //这样能直接取出来了
            print("------> \(Arr)")
            
//            self.jsonValue = JSON(Response.data!)
        }
        
        showMe()
        
    }
    
    
    func showMe() -> String {
        
        return "zhang"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

