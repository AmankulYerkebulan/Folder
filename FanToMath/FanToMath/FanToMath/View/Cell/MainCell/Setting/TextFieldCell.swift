
import Foundation
import UIKit

class TextFieldCell: UITableViewCell {
    
    //MARK: - Variables
    
    private let array:[SettingCellType:String] = [.phone:"Телефон".localized,.name:"Имя".localized,.lastname:"Фамилия".localized,.oblast:"Область".localized,.city:"Город".localized,.school:"Школа".localized,.levelclass:"Класс".localized,.language:"Язык обучения".localized,.newPaassword:"Новый пароль".localized,.repatPassword:"Повторите пароль".localized,.tarif:"Выберите тариф".localized,.purchaseType: "Выберите способ оплаты".localized]
    
    static var cellIdentifier = "TextFieldCell"
    
    private lazy var textFiled:UITextField = {
        let label = UITextField()
        label.backgroundColor = Global.whiteColor()
        label.layer.borderWidth = 1
        label.layer.borderColor = Global.newsBorderColor().cgColor
        label.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0.5, 0)
        label.font = Global.comicSansFont(size: StaticSize.s18 - 1)
        label.font = Global.asinastraFont(size: StaticSize.s17)
        label.layer.cornerRadius = StaticSize.s10
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "drop-down-arrow"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        return button
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

extension TextFieldCell {
    
    //MARK: - Setup
    
    func setUpPLaceholder(type: SettingCellType) {
        self.textFiled.attributedPlaceholder = NSAttributedString(string: self.array[type]!,
                                                         attributes: [NSAttributedString.Key.foregroundColor: Global.greyColor(),.font: Global.asinastraFont(size: StaticSize.s17)!])
        if type != .oblast && type != .city && type != .school && type != .levelclass && type != .language && type != .tarif && type != .purchaseType {
            self.textFiled.rightView = nil
        } else {
            self.textFiled.rightView = button
            textFiled.rightViewMode = .always
        }
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = Global.whiteColor()
        self.addSubview(textFiled)
        self.backgroundColor = .clear
        self.textFiled.snp.makeConstraints { (iconView) in
            iconView.height.equalTo(StaticSize.s36)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s34)
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s34)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s22)
            iconView.bottom.equalTo(self.snp.bottom)
        }
    }
}

