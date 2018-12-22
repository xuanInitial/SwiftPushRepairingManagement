//
//  LoginViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {

    var dic = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true;

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        dic.updateValue("cstui", forKey: "Account")
        dic.updateValue("qweqwe", forKey: "Password")
        
        loadData()
        createUI()
    }
    
    
    func loadData() {
        
        
        APIManager.loginRequestData(.POST, URLString: PostLogin, parameters: dic) { (result) in
            
            print("\(result)")
            
        }
        
    }
    
    func createUI() {
        
        let titLabel = UILabel()

        titLabel.font = TXBoldFont(x: 24)
        titLabel.text = "留修机器人"
        titLabel.textColor = TXCaptionColor
        view.addSubview(titLabel)
        
        titLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(80)
            make.size.equalTo(CGSize(width: 150, height: 33))
            make.left.equalTo(view).offset(TXMARGIN)
        }
}

}
        //编辑区*********************
        
//        let titLabel: UILabel? = TXViewLayoutHelper.bulidLabel(withFont: TXBoldFont(24))
//        titLabel?.text = "留修机器人"
//        titLabel?.textColor = TXCaptionColor
//        if let aLabel = titLabel {
//            view.addSubview(aLabel)
//        }
//        titLabel?.mas_makeConstraints({ make in
//            make?.top.mas_equalTo(80)
//            make?.size.mas_equalTo(CGSize(width: 150, height: 33))
//            make?.left.mas_equalTo(weakSelf.view).offset(20)
//        })
//
//        let userView = UIView()
//        userView.backgroundColor = UIColor.white
//        view.addSubview(userView)
//
//        userView.mas_makeConstraints({ make in
//            make?.top.mas_equalTo(156)
//            make?.height.mas_equalTo(62.5)
//            make?.left.and().right().mas_equalTo(weakSelf.view)
//        })
//
//        accountTF = TXViewLayoutHelper.structureAccoutView(userView, title: "账号")
//        accountTF.keyboardType = .default
//        accountTF.returnKeyType = .default
//        accountTF.delegate = self
//        accountTF.placeholder = "输入账号"
//
//        accountTF.addTarget(self, action: #selector(self.limitLengths(_:)), for: .editingChanged)
//        accountTF.addTarget(self, action: #selector(self.valueChange(_:)), for: .editingDidBegin)
//        accountTF.addTarget(self, action: #selector(self.valueEnd(_:)), for: .editingDidEnd)
//
//        //完美的分割线
//        accountBottomView = TXViewLayoutHelper.bulidLineView()
//        userView.addSubview(accountBottomView)
//
//        accountBottomView.mas_makeConstraints({ make in
//            make?.top.mas_equalTo(userView.mas_bottom)
//            make?.left.mas_equalTo(userView).offset(20)
//            make?.right.mas_equalTo(userView).offset(-40)
//            make?.height.mas_equalTo(0.5)
//        })
//
//        //密码
//        let pwdView = UIView()
//        pwdView.backgroundColor = UIColor.white
//        view.addSubview(pwdView)
//
//        pwdView.mas_makeConstraints({ make in
//            make?.top.mas_equalTo(userView.mas_bottom).offset(2)
//            make?.left.and().right().mas_equalTo(weakSelf.view)
//            make?.height.mas_equalTo(62.5)
//        })
//
//        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

