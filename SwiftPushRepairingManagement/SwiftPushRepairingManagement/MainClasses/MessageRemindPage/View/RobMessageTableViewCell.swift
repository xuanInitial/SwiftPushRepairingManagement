//
//  RobMessageTableViewCell.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2019/1/3.
//  Copyright © 2019 initial. All rights reserved.
//

import UIKit

typealias RobButtonClickBlock = (RobbingMessageList?) -> Void

var tipLabel: UILabel?/*多方事故。。。 */
var brandNameLabel: UILabel?
var sourceNameLabel: UILabel?
var licenseNoLabel: UILabel?
var carOwnerLabel: UILabel?
var robButton: UIButton?
var robButtonClickBlock: RobButtonClickBlock?
var robMessageModel: RobbingMessageList?



class RobMessageTableViewCell: BaseTableViewCell {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createUI() {
        
        tipLabel = tipLabels()
        contentView.addSubview(tipLabel!)
        brandNameLabel = brandNameLabels()
        contentView.addSubview(brandNameLabel!)
        sourceNameLabel = sourceNameLabels()
        contentView.addSubview(sourceNameLabel!)
        licenseNoLabel = licenseNoLabels()
        contentView.addSubview(licenseNoLabel!)
        carOwnerLabel = carOwnerLabels()
        contentView.addSubview(carOwnerLabel!)
        robButton = robButtons()
        contentView.addSubview(robButton!)
        

        tipLabel?.snp.makeConstraints({ (mark) in
            mark.left.equalTo(self.contentView).offset(TXMARGIN)
            mark.top.equalTo(self.contentView).offset(12)
            mark.height.equalTo(16)
        })
        tipLabel!.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        brandNameLabel?.snp.makeConstraints({ (mark) in
            mark.left.equalTo(self.contentView).offset(TXMARGIN)
            mark.top.equalTo((tipLabel?.snp.bottom)!).offset(12)
            mark.height.equalTo(14)
        })
        brandNameLabel!.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        
    }
    
    func btnClick() {
        
        if (robButtonClickBlock != nil) {
            robButtonClickBlock!(robMessageModel)
        }
    }
    
    func brandNameLabels() -> UILabel? {
        brandNameLabel = TXViewLayoutHelper.bulidLabel(with: TXFont(x:14))
        brandNameLabel!.textColor = TXTextColor
        return brandNameLabel
    }
    
    func sourceNameLabels() -> UILabel? {

        sourceNameLabel = TXViewLayoutHelper.bulidLabel(with: TXBoldFont(x: 10))
        sourceNameLabel!.textColor = ZhuYaoColor
        sourceNameLabel!.layer.cornerRadius = 2
        sourceNameLabel!.layer.masksToBounds = true
        sourceNameLabel!.layer.borderWidth = 1
        sourceNameLabel!.layer.borderColor = ZhuYaoColor.withAlphaComponent(0.7).cgColor
        sourceNameLabel!.textAlignment = .center
        return sourceNameLabel
    }
    
    func tipLabels() -> UILabel? {
        tipLabel = TXViewLayoutHelper.bulidLabel(with: TXBoldFont(x:16))
        tipLabel!.textColor = TXCaptionColor
        return tipLabel
    }
    
    func licenseNoLabels() -> UILabel? {
        licenseNoLabel = TXViewLayoutHelper.bulidLabel(with: TXFont(x:14))
            licenseNoLabel!.textColor = TXNoticeColor
        return licenseNoLabel
    }
    
    func carOwnerLabels() -> UILabel? {

        carOwnerLabel = TXViewLayoutHelper.bulidLabel(with: TXFont(x:14))
        carOwnerLabel!.textColor = TXNoticeColor
        return carOwnerLabel
    }
    
    func robButtons() -> UIButton? {
        robButton = UIButton(type: .custom)
        robButton!.setTitle("抢单", for: .normal)
        robButton!.tintColor = UIColor.white
        robButton!.titleLabel?.font = TXBoldFont(x:16)
        robButton!.backgroundColor = ZhuYaoColor
        robButton!.layer.cornerRadius = 4
        robButton!.layer.masksToBounds = true
        return robButton
    }
    

    
}
