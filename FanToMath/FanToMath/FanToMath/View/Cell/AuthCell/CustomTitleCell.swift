
import Foundation
import UIKit

class CustomTitleCell: UITableViewCell {
    
    //MARK: - Variables
    
    private let placeholder = [AuthorizationType.signIn:"Логин".localized,AuthorizationType.forgotPassword:"Введите номер телефона, который вы указывали при регистрации".localized,AuthorizationType.newPassword:"Введите новый пароль".localized,AuthorizationType.code:"На ваш номер телефона был выслан код для восстановления пароля, пожалуйста введите его в указанное поле".localized,AuthorizationType.language:"Выберите язык".localized,AuthorizationType.signUp:"Регистрация".localized,AuthorizationType.limit:"\nУ вас осталась 30 бесплатных задач!".localized,AuthorizationType.share:"\nНашли ошибку?\nСообщите нам".localized,AuthorizationType.listTranzation:"\nСписок покупок".localized]
    
    static var cellIdentifier = "CustomTitleCell"
    
    private lazy var title:CustomTitleLabel = {
        let label = CustomTitleLabel()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(faqSelected))
        label.addGestureRecognizer(gesture)
        label.isUserInteractionEnabled = true
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

extension CustomTitleCell {
    
    func setUptestLabel(text: String,centerTitle: CellType,testSection: TestSection) {
        
        if testSection == .result || testSection == .timeEnd {
            self.title.textColor = Global.newsBorderColor()
            self.title.font = Global.comicSansFont(size: StaticSize.s17)
        } else {
            self.title.font = Global.asinastraFont(size: StaticSize.s28)
            self.title.textColor = Global.blackColor()
        }
        
        if testSection == .description {
            self.title.font = Global.asinastraFont(size: StaticSize.s20)
            self.title.textColor = Global.blackColor()
            self.title.textAlignment = .center
        }
        
        if centerTitle == .centerTitle {
            self.title.textAlignment = .center
            self.title.text = text
        } else if centerTitle == .title {
            self.title.text = text
            self.title.textAlignment = .left
        }
    }
    
    func setUpTextPlaceholder(title: AuthorizationType,centerTitle: CellType,section: Int) {
        
        self.title.text = self.placeholder[title]
        if centerTitle == .centerTitle {
            self.title.textAlignment = .center
            if title == .code {
                self.title.text = "11:30"
            }
            if title == .signUp && section == 1 {
                self.title.text = "Введите номер телефона"
            }
            if title == .listTranzation {
                self.title.textColor = Global.greyColor()
            }
        } else {
            self.title.textAlignment = .justified
        }
        
        if title != .signIn {
            self.title.font = Global.asinastraFont(size: StaticSize.s20)
        }
        
        if title == .limit || title == .share {
            self.title.textColor = Global.newsBorderColor()
        }
        
        if title == .share {
            let yourAttributes : [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font : Global.asinastraFont(size: StaticSize.s17)!,
                NSAttributedString.Key.foregroundColor : Global.newsBorderColor(),
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
            let attributeString = NSMutableAttributedString(string: self.placeholder[title]!,
                                                            attributes: yourAttributes)
            self.title.attributedText = attributeString
        }
        
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubViews(views: [title])
        self.backgroundColor = .clear
        self.title.snp.makeConstraints { (textFiled) in
            textFiled.left.equalTo(self.snp.left).offset(StaticSize.s55)
            textFiled.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            textFiled.top.equalTo(self.snp.top)
            textFiled.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func setUpTitle() {
        self.title.text = "FanToMath"
        self.title.textAlignment = .center
        self.title.font = Global.asinastraFont(size: StaticSize.s40)
        self.title.textColor = Global.newsBorderColor()
        self.title.snp.makeConstraints { (textFiled) in
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s34)
        }
    }
    
    //MARK: - Action
    
    @objc private func faqSelected() {
        NotificationCenter.default.post(name: .faqSelected, object: nil)
    }
}

