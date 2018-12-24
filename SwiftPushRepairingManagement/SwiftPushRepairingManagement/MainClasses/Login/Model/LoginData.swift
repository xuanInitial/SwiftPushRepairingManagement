//
//	LoginData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import HandyJSON


class LoginData : HandyJSON{

	var account : String?
	var agentId : Int?
	var cityId : Int?
	var departmentId : Int?
	var functionCode : [LoginFunctionCode]?
	var name : String?
	var roleId : Int?
	var roleName : String?
	var roleType : Int?
	var secretKey : String?
	var token : String?
	var topAgentId : Int?


	required init() {}

}
