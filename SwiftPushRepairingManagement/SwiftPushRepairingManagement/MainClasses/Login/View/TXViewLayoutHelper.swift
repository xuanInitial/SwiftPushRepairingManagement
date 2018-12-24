//
//  TXViewLayoutHelper.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/22.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation
import UIKit


class TXViewLayoutHelper: NSObject {
    
    
  class  func bulidLineView() -> UIView {
        
        let lineView = UIView()
        lineView.layer.borderColor = TXBtnBordColor.cgColor
        lineView.layer.borderWidth = 0.3
        lineView.backgroundColor = UIColor.clear
        return lineView
    }
    
    
    class func structureAccoutView(_ view: UIView?, title: String?) -> UITextField? {
        
        let titleLabel: UILabel? = self.bulidLabel(with: TXFont(x:16))
        if let aLabel = titleLabel {
            view?.addSubview(aLabel)
        }
        
        titleLabel?.text = title
        titleLabel?.snp.makeConstraints({ make in
            make.top.equalTo(view!).offset(20)
            make.left.equalTo(view!).offset(20)
            make.size.equalTo(CGSize(width: 33, height: 22))
        })
        
        //输入框
        let txtField = UITextField()
        txtField.textColor = TXTextColor
        txtField.clearButtonMode = .whileEditing
        txtField.borderStyle = .none
        txtField.contentVerticalAlignment = .bottom
        
        view?.addSubview(txtField)
        
        txtField.snp.makeConstraints({ make in
            make.left.equalTo(titleLabel!.snp.right).offset(20)
            make.height.equalTo(30)
            make.top.equalTo(view!).offset(10)
            make.right.equalTo(view!).offset(-40)
        })
        
        
        return txtField
    }
    
    class func bulidLabel(with font: UIFont?) -> UILabel? {
        
        let lab: UILabel? = self.bulidLabel()
        if let aFont = font {
            lab?.font = aFont
        }
        return lab
    }
    class func bulidLabel() -> UILabel? {
        
        let bhLab = UILabel()
        bhLab.textColor = TXTextColor
        bhLab.font = TXFont(x: 16)
        bhLab.textAlignment = .left
        return bhLab
    }
    
}


