//
//  MessageRemindPageViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit
import Moya

class MessageRemindPageViewController: BaseViewController {

    var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



    self.view.backgroundColor = UIColor.white
    self.titleLabel.text = "消息"
      
        //self.AlertController("messages", "")
        
        let userData = UserData.readUserInfo()
        
        print(userData.Token as Any)
        loadData()
    }
    

    func loadData() {
        
        var dic = [String :Any]()
        
        dic.updateValue(self.page, forKey: "PageIndex")
        dic.updateValue(15, forKey: "PageSize")
        dic.updateValue(vCFBundleShortVersionStr!, forKey: "Version")
        
         let  provider = MoyaProvider<NetAPIManager>()
        provider.request(.PostGetMessageList(parameters: dic)) { (result) in
            switch result{
                
              case let .success(response):
                print(response)
                let data = try! (response.mapJSON() as AnyObject).modelToJSONString()
                
                print("dsta:===","\(data ?? "")")
                
                 if let object = MessageRootClass.deserialize(from: data) {
                    
                    
                }
                
                
            case let .failure(error):
                print(error)
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
