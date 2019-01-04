//
//  MessageTableViewCell.swift
//  
//
//  Created by initial on 2019/1/2.
//

import UIKit






class MessageTableViewCell: BaseTableViewCell {

    /**
     *  消息图片
     */
    
    var xiaoxiImg: UIImageView?
    /**
     *  未分配图片
     */
    var processedImg: UIImageView?
    /**
     *  车辆进店到期通知
     */
    var daoqiLabel: UILabel?
    /**
     *  车牌+到期时间
     */
    var allInformationLabel: UILabel?
    /**
     *  进店时间
     */
    var instoreDateLab: UILabel?
    /**
     *  消息数
     */
    var messageNumberLab: UILabel?
    var successfulFailure: UILabel?
    
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
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        backgroundColor = UIColor.white
        createUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createUI(){
        
        xiaoxiImg = UIImageView()
        xiaoxiImg?.image = UIImage(named: "messagetype_0")
        contentView.addSubview(xiaoxiImg!)
        xiaoxiImg?.snp.makeConstraints({ (make) in
            make.left.equalTo(TXMARGIN)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 44, height: 44))
        })
        

        
        daoqiLabel = TXViewLayoutHelper.bulidLabel()
        daoqiLabel?.text = ""
        daoqiLabel?.font = TXBoldFont(x: 16)
        daoqiLabel?.textColor = TXCaptionColor
        contentView.addSubview(daoqiLabel!)
        
        daoqiLabel!.snp.makeConstraints({ (mark) in
            mark.top.equalTo(20)
            mark.left.equalTo(xiaoxiImg!.snp.right).offset(12)
            mark.height.equalTo(22)
        })
        daoqiLabel?.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        
        messageNumberLab = TXViewLayoutHelper.bulidLabel()
        messageNumberLab?.text = "99"
        messageNumberLab?.font = TXFont(x:12)
        messageNumberLab?.textColor = UIColor.white
        messageNumberLab?.backgroundColor = TXRGB(r:255, 68, 68)
        messageNumberLab?.layer.cornerRadius = 8
        messageNumberLab?.layer.masksToBounds = true
        messageNumberLab?.textAlignment = .center
        contentView.addSubview(messageNumberLab!)
        
        messageNumberLab?.snp.makeConstraints({ (mark) in
            mark.centerY.equalTo((daoqiLabel?.snp.centerY)!)
            mark.left.equalTo((daoqiLabel?.snp.right)!).offset(12)
            mark.height.equalTo(16)
        })
 
        messageNumberLab!.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        
        processedImg = UIImageView()
        processedImg?.image = UIImage(named: "processedImg")
        processedImg?.isHidden = true
        contentView.addSubview(processedImg!)
 
        processedImg?.snp.makeConstraints({ (mark) in
            mark.left.equalTo((messageNumberLab?.snp.right)!).offset(12)
            mark.size.equalTo(CGSize(width: 44, height: 18))
            mark.centerY.equalTo((daoqiLabel?.snp.centerY)!)
        })
        successfulFailure = successfulFailures()
        contentView.addSubview(successfulFailure!)
        
        successfulFailure?.snp.makeConstraints({ (mark) in
            mark.left.equalTo((messageNumberLab?.snp.right)!).offset(12)
            mark.size.equalTo(CGSize(width: 50, height: 18))
            mark.centerY.equalTo((daoqiLabel?.snp.centerY)!)
        })
        
        
        allInformationLabel = TXViewLayoutHelper.bulidLabel()
        allInformationLabel?.font = TXFont(x:13)
        allInformationLabel?.text = "京J97896（宝马Cooper）已进店，车险到期还有60天，请点击分配给业务员"
        allInformationLabel?.numberOfLines = 0
        allInformationLabel?.textAlignment = .left
        allInformationLabel?.textColor = TXTextColor
        
        contentView.addSubview(allInformationLabel!)
        allInformationLabel?.snp.makeConstraints({ (mark) in
            mark.top.equalTo((daoqiLabel?.snp.bottom)!).offset(10)
            mark.left.equalTo((xiaoxiImg?.snp.right)!).offset(12)
            mark.right.equalTo(self).offset(-TXMARGIN)
            mark.height.equalTo(18)
        })
        
        
        instoreDateLab = TXViewLayoutHelper.bulidLabel()
        instoreDateLab?.font = TXSubCationFont
        instoreDateLab?.text = "5分钟前"
        instoreDateLab?.textColor = TXNoticeColor
        instoreDateLab?.textAlignment = .right
        contentView.addSubview(instoreDateLab!)
        
        instoreDateLab?.snp.makeConstraints({ (mark) in
            mark.top.equalTo(10)
            mark.right.equalTo(-TXMARGIN)
            mark.height.equalTo(16)
            mark.centerY.equalTo((daoqiLabel?.snp.centerY)!)
        })
        
    }
    
    func successfulFailures() -> UILabel! {
      
        successfulFailure = TXViewLayoutHelper.bulidLabel(with: TXFont(x: 10))
        successfulFailure!.textColor = TXNoticeColor
        successfulFailure!.textAlignment = .center
        successfulFailure!.layer.cornerRadius = 2
        successfulFailure!.layer.masksToBounds = true
        successfulFailure!.layer.borderWidth = 1
        successfulFailure!.text = "已删除"
        successfulFailure!.layer.borderColor = TXRGB(r: 204, 204, 204).cgColor
        successfulFailure?.isHidden = true
     
        return successfulFailure
    }
    

    private var tempModel:MessageList? = MessageList()
    var messageModel : MessageList {
        set {
            tempModel = newValue
            
            if tempModel?.Deleted != 0 {
                xiaoxiImg!.image = UIImage(named: String(format: "messagetype_gray_%ld", (tempModel?.MesaageType)!))
                
                daoqiLabel?.textColor = TXNoticeColor
                allInformationLabel?.textColor = TXNoticeColor
            } else {
                xiaoxiImg!.image = UIImage(named: String(format: "messagetype_%ld", (tempModel?.MesaageType)!))
                daoqiLabel!.textColor = TXCaptionColor
                allInformationLabel?.textColor = TXTextColor
            }
            
            switch tempModel?.MesaageType {
            case 0:
                daoqiLabel!.text = "出险通知"
            case 1:
                daoqiLabel!.text = "超时通知"
            case 2:
                daoqiLabel!.text = "回访通知"
            case 3:
                daoqiLabel!.text = "接车通知"
            case 4:
                daoqiLabel!.text = "流失通知"
            case 5:
                daoqiLabel!.text = "到店通知"
            case 6:
                daoqiLabel!.text = "接待通知"
            case 8:
                daoqiLabel!.text = "领取成功"
            case 9:
                daoqiLabel!.text = "领取失败"
            case 10:
                daoqiLabel!.text = "定损提醒"
            case 11:
                daoqiLabel!.text = "已定损"
            case 12:
                daoqiLabel!.text = "交车提醒"
            case 13:
                daoqiLabel!.text = "已交车"
            case 14:
                daoqiLabel!.text = "指派通知"
            case 15:
                daoqiLabel!.text = "线索过期"
            default:
                break
            }
            
            allInformationLabel?.text = tempModel?.Content
            
            
            if (tempModel?.TimeDifference)! <= 60 * 60 * 24 {
                
                if (tempModel?.TimeDifference)! <= Float(60 * 60) {
                    
                    if (tempModel?.TimeDifference)! / 60 < 1 {
                        instoreDateLab!.text = "现在"
                    } else {
                        instoreDateLab!.text = String(format: "%ld分钟前", (tempModel?.TimeDifference)! / 60)
                    }
                } else {
                    instoreDateLab!.text = String(format: "%ld小时前", (tempModel?.TimeDifference)! / 3600)
                }
            } else {
                if (tempModel?.CreateTime!.count)! > 10 {
                    instoreDateLab!.text = (tempModel?.CreateTime as NSString?)?.substring(to: 10)
                }
            }
            

            if tempModel?.IsHandle! == 1 && tempModel?.MesaageType != 8 && tempModel?.MesaageType != 9 && tempModel!.Deleted == 0 {
                processedImg?.isHidden = false
            } else {
                processedImg?.isHidden = true
            }
            
            if tempModel!.Deleted! != 0 {
                successfulFailure!.isHidden = false
            } else {
                successfulFailure!.isHidden = true
            }

            if  tempModel!.TimeoutNoticeCount! >= 2 {
                messageNumberLab!.isHidden = false
                if tempModel!.IsHandle == 1 || tempModel!.Deleted != 0 {
                    messageNumberLab!.backgroundColor = TXRGB(r:204, 204, 204)
                } else {
                    
                    messageNumberLab!.backgroundColor = TXRGB(r:255, 68, 68)
                }
                if tempModel!.TimeoutNoticeCount! < 10 {

                    messageNumberLab?.snp.makeConstraints({ (mark) in
                        mark.width.equalTo(16)
                    })
                } else {
                    messageNumberLab?.snp.makeConstraints({ (mark) in
                        mark.width.equalTo(32)
                    })
                }
                
                if tempModel!.TimeoutNoticeCount! <= 99 {
                    messageNumberLab!.text = String(format: "%ld", tempModel!.TimeoutNoticeCount!)
                } else {
                    messageNumberLab!.text = "99+"
                }
 
                processedImg?.snp.makeConstraints({ (mark) in
                    mark.left.equalTo((messageNumberLab?.snp.right)!).offset(12)
                })
            } else {
                messageNumberLab!.isHidden = true
                messageNumberLab?.snp.makeConstraints({ (mark) in
                    mark.width.equalTo(0)
                })
                processedImg?.snp.makeConstraints({ (mark) in
                    mark.left.equalTo((messageNumberLab?.snp.right)!).offset(0)
                })
            }
            
            
        }
        get {
            return (self.tempModel)!
        }
        
    }
    
    

}
