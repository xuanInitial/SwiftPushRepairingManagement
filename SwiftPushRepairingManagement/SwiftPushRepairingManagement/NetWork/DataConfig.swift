//
//  DataConfig.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/21.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

/******************************测试********************************/
//let =  "\(BaseUrl)http://192.168.5.19:8123/api/" //

let  BaseUrl  = "http://192.168.5.19:8124/api/" //主干

//
//let =  "\(BaseUrl)http://192.168.5.19:8125/api/" //

//let =  "\(BaseUrl)https://buc.91bihu.com/api/"

//let =  "\(BaseUrl)https://tx.91bihu.com/api/"

//let =  "\(BaseUrl)http://cf.3w.dkys.org/api/"

//登录

let   PostLogin =  "\(BaseUrl)Accident/Login"


//获取消息列表
let PostGetMessageList = "\(BaseUrl)Accident/GetMessage"


//抢单
let PostGrabOrder = "\(BaseUrl)Accident/GrabOrder"


/**
 保存代理人和极光账户关系
 */
let PostSaveJgAccount = "\(BaseUrl)Accident/SaveJgAccount"


/***************************线索**********************************/
/**
 获取线索管理总数
 */
let PostGetAccidentClueTotalCout = "\(BaseUrl)Accident/GetAccidentClueTotalCout"


/**
 线索管理列表+搜索
 */
let PostGetAccidentClue =  "\(BaseUrl)Accident/GetAccidentClue"

//获取续保
let GetRenewalUri =  "\(BaseUrl)Accident/TXGetReInfo"


//获取续保9月1号新的
let GetNewTGetReInfo =  "\(BaseUrl)Accident/TGetReInfo"

//获取线索详情
let PostGetClusDetails =  "\(BaseUrl)Accident/GetClusDetails"


//获取跟进记录
let PostGetFollowReport =  "\(BaseUrl)Accident/GetFollowReportV2" //2.1版本修改



//删除线索
let PostDelAppClue =  "\(BaseUrl)Accident/DelAppClue" //2.5版本修改

/*****************************短信********************************/

/**
 获取短信模板
 */
let PostGetSmsTemplateList =  "\(BaseUrl)Accident/GetSmsTemplateList"

/**
 跟进记录发送短信
 */
let PostSendMessage =  "\(BaseUrl)Accident/SendMessage"


/*****************************录入跟进********************************/

/**
 获取跟进状态
 */
let PostGetFollowUpStates =  "\(BaseUrl)Accident/GetFollowUpStates"

let PostGetFollowUpStatesV2 =  "\(BaseUrl)Accident/GetFollowUpStatesV2"//2.3版本以后使用

/**
 获取流失原因
 */
let PostGetLossReasons =  "\(BaseUrl)Accident/GetLossReasons"

/**
 获取顶级代理人下所有接车人
 */
let PostGetRecivesCarPeoples =  "\(BaseUrl)Accident/GetRecivesCarPeoples"

/**
 录入跟进
 */
let PostInputFollowUp =  "\(BaseUrl)Accident/InputFollowUp"


/**
 编辑线索
 */
let PostEditClueInfo =  "\(BaseUrl)Accident/EditClueInfo"


/**
 获取保险公司和案件类型
 */
let PostGetClueParam =  "\(BaseUrl)Accident/GetClueParam"


/**
 线索是否可以跟进
 */
let PostIsCanFollow =  "\(BaseUrl)Accident/IsCanFollow"



/**
 跟进上图片
 */
let PostUploadImg =  "\(BaseUrl)Accident/UploadImg"


/*****************************个人中心统计********************************/
/**
 获取个人中心统计信息
 */
let PostGetStatisticsInfo =  "\(BaseUrl)Accident/GetStatisticsInfo"


/**
 版本号比较
 */
let PostCompareVersion =  "\(BaseUrl)Accident/CompareVersion"


/**
 退出
 */
let PostSignOut =  "\(BaseUrl)Accident/SignOut"


/**
 新增线索
 */
let PostAddClues =  "\(BaseUrl)Accident/AddClues"



/**
 打电话校验
 */
let PostExitCallPhone =  "\(BaseUrl)Accident/ExitCallPhone"
