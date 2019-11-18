//
//  PersonalCenterViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit
import Moya
class PersonalCenterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
      loadOut()
    }
    

    func loadOut(){
        
        let dic = [String :Any]()

        let  provider = MoyaProvider<NetAPIManager>()
        provider.request(.PostSignOut(parameters: dic)) { (result) in
            switch result{
                
            case let .success(response):
                print(response)
                let data = try! (response.mapJSON() as AnyObject).modelToJSONString()
                
                print("dsta:===","\(data ?? "")")
                
                let loginVc = LoginViewController()
                let logNav = BaseNavigationController(rootViewController: loginVc)
                let app = UIApplication.shared.delegate as? AppDelegate
                app?.window!.rootViewController = logNav
                
                UserDefaults.UserData.remove(forKey: .loginData)
                UserDefaults.JudgeFirst.remove(forKey: .PushRepairingManagementFirst)
                
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
