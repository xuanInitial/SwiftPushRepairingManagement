//
//  MessageRemindPageViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit
import Moya

class MessageRemindPageViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    

    var page = 1
    
    let messageTableView = BaseTableView()
    fileprivate lazy var messageListDate : [MessageList] = []  //创建一个数组
    fileprivate lazy var robMessageData : [RobbingMessageList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()



    self.view.backgroundColor = UIColor.white
    self.titleLabel.text = "消息"
      
        //self.AlertController("messages", "")
        
        let userData = UserData.readUserInfo()
        
        print(userData.Token as Any)
        loadData()
        createUI()
    }
    
    func createUI() {
        
        messageTableView.frame = CGRect (x: 0, y: 64, width: TXSCREEN_W, height: TXSCREEN_H-64-49)
        messageTableView.delegate = self;
        messageTableView.dataSource = self;
      //  messageTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        messageTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
         messageTableView.register(RobMessageTableViewCell.self, forCellReuseIdentifier: "RobMessageTableViewCell")
        
        self.view .addSubview(messageTableView)
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
                    
                    self.messageListDate = (object.Data?.MessageList)!
                }
                
                self.messageTableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section==0 {
            return self.robMessageData.count
        }
        return self.messageListDate.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0 {
            let robCell = tableView.dequeueReusableCell(withIdentifier: "RobMessageTableViewCell") as! RobMessageTableViewCell
            robCell.selectionStyle = UITableViewCell.SelectionStyle.none
            

           // messageCell.messageModel = self.messageListDate[indexPath.row]
            return robCell
        }else{
            let messageCell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell") as! MessageTableViewCell
            messageCell.selectionStyle = UITableViewCell.SelectionStyle.none
            messageCell.messageModel = self.messageListDate[indexPath.row]
            return messageCell
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
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
