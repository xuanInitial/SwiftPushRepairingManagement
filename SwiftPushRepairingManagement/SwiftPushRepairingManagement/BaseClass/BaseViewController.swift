//
//  BaseViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
     lazy   var titleLabel:UILabel = {
       
        let titleLab = UILabel(frame: CGRect(x: 0, y: 0, width: Int(TXSCREEN_W/2), height: TXNavigationBar))
        titleLab.textAlignment = NSTextAlignment.center
        titleLab.font = TXFont(x: 16)
        titleLab.textColor = UIColor.black
        titleLab.text = "标题"
        return titleLab;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.navigationItem.titleView = self.titleLabel
        // Do any additional setup after loading the view.
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
