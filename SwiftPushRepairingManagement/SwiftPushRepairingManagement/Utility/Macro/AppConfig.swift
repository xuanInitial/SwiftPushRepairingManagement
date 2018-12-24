//
//  AppConfig.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/19.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation
import UIKit
//视图的背景色
let TXBackColor  = TXRGB(r: 238,238,238)
//标题颜色
let TXCaptionColor = TXRGB(r:51,51,51)
//文本颜色
let TXTextColor = TXRGB(r:102,102,102)
//描述颜色
let TXNoticeColor = TXRGB(r:153,153,153)

//按钮边线
let TXBtnBordColor = TXRGB(r:204,204,204)

let TXNaviLineColor = TXRGBALPHA(r:0,0,0,0.30)

//标题字体
let TXCationFont =  TXBoldFont(x:16)

//副标题字体
let TXSubCationFont = TXFont(x:12)

let  TXTextFont = TXFont(x:14)

let  TX13Font  = TXFont(x:13)



let  TX16Font = TXFont(x:16)

let  TX10Font = TXFont(x:10)


//按钮颜色
let  HightLineColor = TXRGB(r:239, 59, 59)
let  NormalColor = TXRGB(r:255, 139, 139)


//状态栏高度
let  TXStatus = UIApplication.shared.statusBarFrame.size.height

//标题栏高度
let  TXNavigationBar = 44

//导航栏总高度

let  TXTotalHight  = (TXStatus+44)

//tabbar
//let  TXTabBarHeight =  self.tabBarController.tabBar.bounds.size.height
/**
 *  默认间距
 */
let  TXMARGIN = 16



//颜色

func TXRGB (r:CGFloat,_ g:CGFloat,_ b:CGFloat) ->UIColor {
    
    return UIColor (red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha:1.0)
}

//颜色
func TXRGBALPHA (r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) ->UIColor {
    
    return UIColor (red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha:a)
}

let ZhuYaoColor = TXRGB(r: 1, 136, 251)

/** 字体*/

func TXFont(x:CGFloat) ->UIFont{
    
    return UIFont.systemFont(ofSize: x)
}

func TXBoldFont(x:CGFloat) ->UIFont{
    
    return UIFont.boldSystemFont(ofSize: x)
}


/** 获取硬件信息*/
let TXSCREEN_W = UIScreen.main.bounds.size.width
let TXSCREEN_H = UIScreen.main.bounds.size.height


let  WIDTHBASE = (TXSCREEN_W/375.0)
let  HEIGHTBASE = (TXSCREEN_H/667.0)



//判断是否是iOS10
let  iOS10 = ((NSFoundationVersionNumber >= NSFoundationVersionNumber10_10) && (Int32(NSFoundationVersionNumber) < NSFoundationVersionNumber10_11)) ? 1:0

//#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

let  iPhoneX =  (((kSTATUSBARHEIGGT)==44) ? 1 : 0)

let  kSTATUSBARHEIGGT = (((UIApplication.shared.statusBarFrame.size.height==40||UIApplication.shared.statusBarFrame.size.height==64) ?(UIApplication.shared.statusBarFrame.size.height-20):UIApplication.shared.statusBarFrame.size.height))


let  VMiPhone4_OR_4s  =  (TXSCREEN_H == 480)
let   VMiPhone5_OR_5c_OR_5s  =  (TXSCREEN_H == 568)
let VMiPhone6_OR_6s =  (TXSCREEN_H == 667)
let VMiPhone6Plus_OR_6sPlus  = (TXSCREEN_H == 736)


//判断是否是iOS11
let  iOS11  =  (Int32(NSFoundationVersionNumber) >= NSFoundationVersionNumber10_11) ? 1: 0


/** 弱指针*/
//#define TXWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self



let vCFBundleShortVersionStr  = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")

///*Alert弹出提示对话框*/
//#define TXAlertController(title, msg)             UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];\
//[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];\
//[self presentViewController:alert animated:YES completion:nil];
//
//
//
////判断字符串为空
//#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

//#if DEBUG
//#define TXLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define TXLog(...)

//#define WEAKSELF __weak typeof(self) weakSelf = self
//#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
//#define FIT_WIDTH [UIScreen mainScreen].bounds.size.width/375
//
//#define KButtonColor            [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
