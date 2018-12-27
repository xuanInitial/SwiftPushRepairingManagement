//
//	MessageData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import HandyJSON

class MessageData : HandyJSON{

	var MessageList : [MessageList]?
	var PageIndex : Int?
	var PageSize : Int?
	var TotalCount : Int?

    required init() {}
}
