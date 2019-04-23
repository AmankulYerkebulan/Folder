
import Foundation
import UIKit

class ForgorPasswordCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "ForgorPasswordCell"
    
    private lazy var title:CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.font = Global.asinastraFont(size: StaticSize.s11)
        label.textColor = Global.blueColor()
        label.text = "Забыли пароль?".localized
        label.textAlignment = .right
        let gesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordPressed))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
}

//MARK: - Setup

extension ForgorPasswordCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubViews(views: [title])
        self.backgroundColor = .clear
        self.title.snp.makeConstraints { (textFiled) in
            textFiled.left.equalTo(self.snp.left).offset(StaticSize.s55)
            textFiled.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s19)
            textFiled.bottom.equalTo(self.snp.bottom)
        }
    }
    
    //MARK: - Action
    
    @objc private func forgotPasswordPressed() {
        NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.forgotPassword)
    }
    
}

