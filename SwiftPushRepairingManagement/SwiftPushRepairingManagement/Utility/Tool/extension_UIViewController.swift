//
//  extension_UIViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit

extension UIViewController {
    func ex_addBackBarButton() {
            let back = UIBarButtonItem.init(title: "返", style: .plain, target: self, action: #selector(ex_backBarButtonClick))
        
        //let back = UIBarButtonItem.init(image: #imageLiteral(resourceName: "cartoon_navigation_back_black"), style: .plain, target: self, action: #selector(ex_backBarButtonClick))
        back.tintColor = UIColor.init(rgba: 0x333333)
        self.navigationItem.leftBarButtonItem = back
    }
    @objc func ex_backBarButtonClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func AlertController(_ title:String?,_ message:String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "确定", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func AlertController(_ title:String?,_ message:String?, handler:@escaping ()->Void)
    {
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "确定", style: .cancel, handler: { (_) in
                handler()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
