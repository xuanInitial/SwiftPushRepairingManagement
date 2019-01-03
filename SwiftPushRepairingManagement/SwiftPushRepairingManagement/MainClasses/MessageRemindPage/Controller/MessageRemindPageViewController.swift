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
                    
                    
                }
                
                
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell") as! MessageTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
      //  cell.data = self.danceListDate[indexPath.row]
     //cell.messageModel
        return (cell ?? nil)!
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
