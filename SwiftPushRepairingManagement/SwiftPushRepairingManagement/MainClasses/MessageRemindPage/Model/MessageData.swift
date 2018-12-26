//
//	MessageData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import HandyJSON

class MessageData : HandyJSON{

	var messageList : [MessageList]?
	var pageIndex : Int?
	var pageSize : Int?
	var totalCount : Int?

    required init() {}
}
