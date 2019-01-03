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
            
        }
        get {
            return (self.tempModel)!
        }
        
    }
    
    

}
