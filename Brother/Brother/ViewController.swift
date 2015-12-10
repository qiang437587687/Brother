//
//  ViewController.swift
//  Brother
//
//  Created by zhang on 15/11/24.
//  Copyright © 2015年 zhang. All rights reserved.
//

/*
1.这里面写了  Alamofire的用法.但是现在就是简单的用法. 上传图片什么的都还没有写
2.这里面简单的用量 swiftymodel 的用法,也并没有什么特别的但是并没有直接可用的model
*/


import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


//这个是马上要请求的接口 http://api.youaiyihu.com/v5/workers
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var Json : JSON?
    var dataArr = [JSON]()
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func animationAction(sender: UIButton) {
        print("button Action")
    }
    @IBOutlet weak var timingLabel: UILabel!
    
//    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
//        print(unwindSegue)
//        print(subsequentVC)
//
//    }
   /**
     知识点: 实现这个函数 @IBAction 和 UIStoryboardSegue 这两个参数 之后 就能用storyBoard 里面的Exit按钮来连接
    */
    @IBAction func backFromSubViewController(unwindSegue: UIStoryboardSegue,towardsViewController subsequentVC: UIViewController) {
        //在这里是连接回来的函数
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configViews()
        tempTest()
        
        
        let start = CACurrentMediaTime()
        otherControllerTest()
        let end = CACurrentMediaTime()
        timingLabel.text = "执行这个函数需要的时间: \((end - start) * 1000)ms"

    }

    deinit { // NOTE: This is like -dealloc in Objective-C
        print("Deinit")
    }
    
    
    func tempTest() {
        //        Array;
        //          var arr = [NSNumber](count: 3, repeatedValue:@(.0f)) swift 中貌似不能这么玩啊
    }
    
    
    func otherControllerTest() {
        
    /**********下面的这些需要哪个就打开哪个好了***********/

        
//        let how = HowToUseBracket()
//        how.test()
//        
//        ClosureTest.test()//直接用类方法
//        let Closure = ClosureTest() //闭包用法
//        Closure.someFunction { (s1) -> String in
//            print("some in somFunc \(s1)")
//            return s1 + "dabao in Main"
//        }
//        
//        let enmuTest = EnumTest()
//        enmuTest.test()
//        
//        let Generics = GenericsTest()
//        Generics.test()
//        
//        let Properties = PropertiesTest()
//        Properties.test()
//        
//        let structt = StructTest()
//        structt.test()
//        
//        let extensionn = ExtensionTest()
//        extensionn.test()
//     
//        let protocoll = ProtocolTest()
//        protocoll.test()
//        
//        let moreOptional = MoreOptional()
//        moreOptional.test()
//        
//        let typecasting = TypeCastingTest()
//        typecasting.test()
//        
//        let whereTest = WhereTest()
//        whereTest.test()
        
//        let DynamicTypeT = DynamicTypeTest()
//        DynamicTypeT.test()
//
//        let SubscriptTestT = SubscriptTest()
//        SubscriptTestT.test()

//        let manager1 = MyManager.sharedInstance
//        let manager2 = MyManager.sharedInstance
//        print(manager1) //lldb p (Brother.MyManager) $R1 = 0x00007ffd2bf55b40 {}
//        print(manager2) //lldb p (Brother.MyManager) $R1 = 0x00007ffd2bf55b40 {}
        
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
            
//            print("------> \(Arr)")
            
            self.dataArr += Arr
            
            self.tableView .reloadData()
            
//            self.jsonValue = JSON(Response.data!)
        }
        
        
        Alamofire.request(.POST, "http://api.youaiyihu.com/v5/workers",parameters: nil).responseData { (Response) -> Void in
            
//            print("要开始打印啦~~\(Response.data)")
        }
        
        //
        
        //这个地方使用一下 setValuesForKeysWithDictionary 这个方法来试验一下是不是能成功的转换(结果:转换是可以的也一直能用,但是这里面却不能直接转换出数组里面的model 以后可能还需要好好研究一下.)
//        let  dic = ["zhang":"1","han":"2","xian":"3","xiu":["2","3","4","5"]]
//        
//        let jsonObject = JsonModelClass()
//        
//        jsonObject.setValuesForKeysWithDictionary(dic)
//        
//        print("zhang = \(jsonObject.zhang) han = \(jsonObject.han) qiang = \(jsonObject.qiang) xiu = \(jsonObject.xiu)")

    }
    
    //tabelview datasource && delegate
    
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
        
        let url : NSURL = NSURL(string: subJson["pic"].stringValue)!
        
        //使用kf来代替原来OC的SDWebImage的图片加载功能
        Cell.headerImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "BrotherPic"))
        
        return Cell
    }
    
}

