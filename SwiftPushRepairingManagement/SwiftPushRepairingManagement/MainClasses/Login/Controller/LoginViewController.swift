//
//  LoginViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    var dic = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true;

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        loadData()
        dic.updateValue("cstui", forKey: "Account")
        dic.updateValue("qweqwe", forKey: "Password")
    }
    
    
    func loadData() {
        
        
        APIManager.loginRequestData(.POST, URLString: PostLogin, parameters: dic) { (result) in
            
            print("\(result)")
            
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
