//
//  DataConfig.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/21.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

/******************************测试********************************/

let  BaseUrl  = "http://192.168.5.19:8124/api/" //主干

//
//let  BaseUrl =  "http://192.168.5.19:8125/api/" //



//let  BaseUrl = "https://tx.91bihu.com/api/"






/**
 保存代理人和极光账户关系
 */
let PostSaveJgAccount = "Accident/SaveJgAccount"


/***************************线索**********************************/
/**
 获取线索管理总数
 */
let PostGetAccidentClueTotalCout = "Accident/GetAccidentClueTotalCout"


/**
 线索管理列表+搜索
 */
let PostGetAccidentClue =  "Accident/GetAccidentClue"

//获取续保
let GetRenewalUri =  "Accident/TXGetReInfo"


//获取续保9月1号新的
let GetNewTGetReInfo =  "Accident/TGetReInfo"

//获取线索详情
let PostGetClusDetails =  "Accident/GetClusDetails"


//获取跟进记录
let PostGetFollowReport =  "Accident/GetFollowReportV2" //2.1版本修改



//删除线索
let PostDelAppClue =  "Accident/DelAppClue" //2.5版本修改

/*****************************短信********************************/

/**
 获取短信模板
 */
let PostGetSmsTemplateList =  "Accident/GetSmsTemplateList"

/**
 跟进记录发送短信
 */
let PostSendMessage =  "Accident/SendMessage"


/*****************************录入跟进********************************/

/**
 获取跟进状态
 */
let PostGetFollowUpStates =  "Accident/GetFollowUpStates"

let PostGetFollowUpStatesV2 =  "Accident/GetFollowUpStatesV2"//2.3版本以后使用

/**
 获取流失原因
 */
let PostGetLossReasons =  "Accident/GetLossReasons"

/**
 获取顶级代理人下所有接车人
 */
let PostGetRecivesCarPeoples =  "Accident/GetRecivesCarPeoples"

/**
 录入跟进
 */
let PostInputFollowUp =  "Accident/InputFollowUp"


/**
 编辑线索
 */
let PostEditClueInfo =  "Accident/EditClueInfo"


/**
 获取保险公司和案件类型
 */
let PostGetClueParam =  "Accident/GetClueParam"


/**
 线索是否可以跟进
 */
let PostIsCanFollow =  "Accident/IsCanFollow"



/**
 跟进上图片
 */
let PostUploadImg =  "Accident/UploadImg"


/*****************************个人中心统计********************************/
/**
 获取个人中心统计信息
 */
let PostGetStatisticsInfo =  "Accident/GetStatisticsInfo"


/**
 版本号比较
 */
let PostCompareVersion =  "Accident/CompareVersion"


/**
 退出
 */
let PostSignOut =  "Accident/SignOut"


/**
 新增线索
 */
let PostAddClues =  "Accident/AddClues"



/**
 打电话校验
 */
let PostExitCallPhone =  "Accident/ExitCallPhone"
