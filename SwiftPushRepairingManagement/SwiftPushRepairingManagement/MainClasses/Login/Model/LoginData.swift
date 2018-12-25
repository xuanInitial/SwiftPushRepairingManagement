//
//	LoginData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import HandyJSON


class LoginData : HandyJSON{

	var Account : String?
	var AgentId : Int?
	var CityId : Int?
	var DepartmentId : Int?
	var FunctionCode : [LoginFunctionCode]?
	var Name : String?
	var RoleId : Int?
	var RoleName : String?
	var RoleType : Int?
	var SecretKey : String?
	var Token : String?
	var TopAgentId : Int?


	required init() {}

}
