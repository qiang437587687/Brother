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
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var Json : JSON?
    var dataArr = [JSON]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configViews()
    }

    func configViews() {
 
        self.tableView!.registerNib(UINib(nibName: "FirstCell_Test", bundle: nil), forCellReuseIdentifier: "FirstCellTest")
    }
    
    func loadData() -> () {
        
        Alamofire.request(.GET, "http://api.youaiyihu.com/v5/workers", parameters: nil).responseData { (Response) -> Void in
         
//            print(Response.description)//data 的 description
//            print(Response.result)
//            print(Response.data)
//            print(Response.request)
//            print(Response.response)
            
            
            self.Json = JSON(data:Response.data!) //这个地方接收的是data类型的数据 不能是json类型的么??
            let Arr = self.Json!["data"]["items"].arrayValue //这样能直接取出来了
            print("------> \(Arr)")
            
            self.dataArr += Arr
            
            self.tableView .reloadData()
            

//            self.jsonValue = JSON(Response.data!)
        }
        
        
    }
    
    //tabelview datasource && delegate
    /*
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    */
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 173
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let Cell : FirstCell_Test = tableView.dequeueReusableCellWithIdentifier("FirstCellTest", forIndexPath: indexPath) as! FirstCell_Test
        
        let subJson = dataArr[indexPath.row]
        
        Cell.name.text = subJson["name"].stringValue

        Cell.hospital.text = subJson["hospital_id"].stringValue
        
        return Cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

