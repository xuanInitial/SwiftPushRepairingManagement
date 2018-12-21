//
//  RootTabBarViewController.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white;
        
        let messageVC = MessageRemindPageViewController()
        let personalVC = PersonalCenterViewController()
        let clueListVC = CluesManagementPageViewController()
        let statisticalVC = StatisticalViewController()
        
        messageVC.tabBarItem = UITabBarItem.init(title: "消息", image: UIImage(named: "icon_message_normal") , selectedImage: UIImage(named: ""))
        
        clueListVC.tabBarItem = UITabBarItem.init(title: "线索管理", image: UIImage(named: "icon_CluesManagement_normal") , selectedImage: UIImage(named: ""))
        
        statisticalVC.tabBarItem = UITabBarItem.init(title: "统计", image: UIImage(named: "icon_ statistical_normal") , selectedImage: UIImage(named: ""))
        
        personalVC.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage(named: "icon_PersonalCenter_normal") , selectedImage: UIImage(named: ""))
        
        
        let n1 = BaseNavigationController.init(rootViewController:messageVC)
        let n2 = BaseNavigationController.init(rootViewController: clueListVC)
        let n3 = BaseNavigationController.init(rootViewController: statisticalVC)
        let n4 = BaseNavigationController.init(rootViewController: personalVC)
        
        self.viewControllers = [n1,n2,n3,n4]
        
        self.selectedIndex = 0; //选中第一行
        
        self.tabBar.tintColor = ZhuYaoColor
        
        
        
        
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
