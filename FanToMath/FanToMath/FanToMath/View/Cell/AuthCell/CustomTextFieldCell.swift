
import Foundation
import UIKit

class CustomTextFieldCell: UITableViewCell {
    
    //MARK: - Variables
    
    private let placeholder = [CellType.phone:"Номер телефона".localized,CellType.password:"Введите пароль".localized,CellType.repeatPassword:"Повторите новый пароль".localized,CellType.newPassword:"Введите новый пароль".localized,CellType.code:"Введите код из смс".localized]
    
//    private let placeHolderImage = [LoginTextFiledType.email:UIImage(named:"mail"),LoginTextFiledType.password:UIImage(named: "password"),LoginTextFiledType.city: UIImage(named: "locationBorder"),LoginTextFiledType.phone: UIImage(named: "phoneNumber"),LoginTextFiledType.fullname:  UIImage(named: "name"),LoginTextFiledType.location:UIImage(named: "locationBorder"),LoginTextFiledType.preciseLocation:UIImage(named: "locationBorder"),LoginTextFiledType.date:UIImage(named: "dateBorder"),LoginTextFiledType.oldPassword:UIImage(named: "password"),LoginTextFiledType.newPassword:UIImage(named: "password"),LoginTextFiledType.price:UIImage(named: "price")]
    
    static var cellIdentifier = "CustomTextFieldCell"
    
    private lazy var textFiled:CutomTextField = {
        let label = CutomTextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        button.addTarget(self, action: #selector(showPasswordTextRepeate), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -32, bottom: 0, right: 0)
        button.setImage(UIImage(named: "visibility"), for: .normal)
        label.rightViewMode = .always
        label.rightView = button
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

extension CustomTextFieldCell {
    
    func setUpTextFiledPlaceholder(title: CellType) {
        
        self.textFiled.placeholder = self.placeholder[title]
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubViews(views: [textFiled])
        self.backgroundColor = .clear
        self.textFiled.snp.makeConstraints { (textFiled) in
            textFiled.left.equalTo(self.snp.left).offset(StaticSize.s55)
            textFiled.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            textFiled.height.equalTo(StaticSize.s46)
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s12)
            textFiled.bottom.equalTo(self.snp.bottom)
        }
    }
}

extension CustomTextFieldCell {
    
    @objc private func showPasswordTextRepeate(sender: UIButton) {
        
        if let textFiled  = sender.superview as? CutomTextField {
            
            textFiled.isSecureTextEntry = !textFiled.isSecureTextEntry
            let button = self.textFiled.rightView as! UIButton
            
            if textFiled.isSecureTextEntry == true {
                button.setImage(UIImage(named: "visibility"), for: .normal)
            } else {
                button.setImage(UIImage(named: "hidePasswordText"),for: .normal)
            }
        }
    }
    
}
