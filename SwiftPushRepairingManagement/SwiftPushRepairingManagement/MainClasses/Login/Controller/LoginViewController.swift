//
//  LoginViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit
import SnapKit
import Moya


class LoginViewController: BaseViewController,UITextFieldDelegate {

    var dic = [String:String]()
    
    var accountTF = UITextField()
    
    var accountBottomView = UIView()
    
    var passwordTF = UITextField()
    
    var passwordBottomView = UIView()

    var loginBtn = UIButton()
    
    //private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true;

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        createUI()
    }
    
    func createUI() {
        
        let titLabel = UILabel()

        titLabel.font = TXBoldFont(x: 24)
        titLabel.text = "留修机器人"
        titLabel.textColor = TXCaptionColor
        view.addSubview(titLabel)
        
        titLabel.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.size.equalTo(CGSize(width: 150, height: 33))
            make.left.equalTo(view).offset(TXMARGIN)
        }
        
        let userView = UIView()
        userView.backgroundColor = UIColor.white
        view.addSubview(userView)
        
        userView.snp.makeConstraints { (make) in
            make.top.equalTo(156)
            make.height.equalTo(62.5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        accountTF = TXViewLayoutHelper.structureAccoutView(userView, title: "账号")!
        accountTF.keyboardType = .default
        accountTF.returnKeyType = .default
        accountTF.delegate = self
        accountTF.placeholder = "输入账号"
        

        accountTF.addTarget(self, action: #selector(valueChange), for: .editingDidBegin)
        accountTF.addTarget(self, action: #selector(valueEnd), for: .editingDidEnd)
        accountTF.addTarget(self, action: #selector(limitLengths), for: .editingChanged)
        
        //完美的分割线
        accountBottomView = TXViewLayoutHelper.bulidLineView()
        userView.addSubview(accountBottomView)
        
        accountBottomView.snp.makeConstraints({ make in
            make.top.equalTo(userView.snp.bottom)
            make.left.equalTo(userView).offset(20)
            make.right.equalTo(userView).offset(-40)
            make.height.equalTo(0.5)
        })
        
        
        //密码
        
        //密码
        let pwdView = UIView()
        pwdView.backgroundColor = UIColor.white
        view.addSubview(pwdView)
        
        pwdView.snp.makeConstraints({ make in
            make.top.equalTo(userView.snp.bottom).offset(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(62.5)
        })
        //注意调用顺序
        passwordTF = TXViewLayoutHelper.structureAccoutView(pwdView, title: "密码")!
        passwordTF.addTarget(self, action: #selector(limitLengths), for: .editingChanged)

        passwordTF.addTarget(self, action: #selector(valueChange), for: .editingDidBegin)
        passwordTF.addTarget(self, action: #selector(valueEnd), for: .editingDidEnd)
        
        
        passwordTF.keyboardType = .default
        passwordTF.returnKeyType = .done
        passwordTF.isSecureTextEntry = true
        passwordTF.delegate = self
        passwordTF.placeholder = "输入密码"
        
        
        //完美的分割线
        passwordBottomView = TXViewLayoutHelper.bulidLineView()
        pwdView.addSubview(passwordBottomView)
        
        passwordBottomView.snp.makeConstraints({ make in
            make.top.equalTo(pwdView.snp.bottom)
            make.left.equalTo(pwdView).offset(20)
            make.right.equalTo(pwdView).offset(-40)
            make.height.equalTo(0.5)
        })
        

        
        loginBtn = UIButton(type: .roundedRect)
        loginBtn.backgroundColor = TXRGB(r:125, 195, 255)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        loginBtn.tintColor = UIColor.white
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.isEnabled = false
        loginBtn.layer.cornerRadius = 22
        loginBtn.layer.masksToBounds = true
        
        loginBtn.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
        
        view.addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints({ make in
            make.top.equalTo(pwdView.snp.bottom).offset(60.5)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(44)
        })

        

        }
    
     @objc fileprivate func  limitLengths(sender:UITextField){
        
        let textStr = sender.text
        if textStr!.count >= 1 && sender == passwordTF {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = ZhuYaoColor
        } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = TXRGB(r:125, 195, 255)
        }
        
        if textStr!.count < 1 && sender == accountTF {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = TXRGB(r:125, 195, 255)
        }
        
        if sender == accountTF && textStr!.count > 1 && passwordTF.text!.count > 1 {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = ZhuYaoColor
        }
        
    }
    
    // MARK: -监测textField的输入
    @objc fileprivate func valueChange(_ textField: UITextField?) {
        
        if textField == accountTF {
            
            accountBottomView.layer.borderColor = ZhuYaoColor.cgColor
        } else {
            passwordBottomView.layer.borderColor = ZhuYaoColor.cgColor
        }
        
    }
    
    // MARK: -监听textField的结束
    @objc fileprivate func valueEnd(_ textField: UITextField?) {
        
        if textField == accountTF {
            
            accountBottomView.layer.borderColor = TXBtnBordColor.cgColor
        } else {
            passwordBottomView.layer.borderColor = TXBtnBordColor.cgColor
        }
    }
    

    
    
    @objc func doLogin() {
        
        accountTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        
        dic.updateValue(accountTF.text ?? "", forKey: "Account")
        dic.updateValue(passwordTF.text ?? "" , forKey: "Password")

        let  provider = MoyaProvider<MyService>()
        
            provider.request(.login(parameters: dic)) { result in
            switch result {
            case let .success(moyaResponse):
  
                let data = try! moyaResponse.mapJSON()
                
                 let string = (data as AnyObject).modelToJSONString()
                print("dsd:===","\(data)")
                if let object = LoginRootClass.deserialize(from: string) {
                    
                    print("\(object)")
                    
                    if let code = object.code{
                        
                        if Int(code) == 1 {
                            let app = UIApplication.shared.delegate as? AppDelegate
                            
                            let root = RootTabBarViewController()
                            
                            app?.window!.rootViewController = root
                        }
                        
                        self.AlertController("\(object.message ?? "")", "")
                    }
                    
                }

            case let .failure(error):
                
                print(error)
            }
        }
        
        
        
    }
    

}
        //编辑区*********************



//
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

