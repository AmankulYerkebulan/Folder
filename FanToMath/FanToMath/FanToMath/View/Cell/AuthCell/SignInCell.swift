
import Foundation
import UIKit

class SignInCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "SignInCell"
    
    lazy var button:UIButton = {
        let label = UIButton()
        label.layer.borderColor = Global.whiteColor().cgColor
        label.layer.cornerRadius = 2
        label.setTitleColor(Global.whiteColor(), for: .normal)
        label.titleLabel?.font = Global.asinastraFont(size: StaticSize.s20)
        label.titleLabel?.textAlignment = .center
        label.setTitle("Войти".localized, for: .normal)
        label.layer.borderWidth = 1
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var icon:UIButton = {
        let label = UIButton()
        label.setImage(UIImage(named: "menu"), for: .normal)
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

extension SignInCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [button,icon])
        
        self.icon.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s40)
            iconView.height.equalTo(StaticSize.s40)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s18)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s36)
            iconView.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s36)
        }
        
        self.button.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s75)
            iconView.height.equalTo(StaticSize.s40)
            iconView.left.equalTo(self.icon.snp.right).offset(StaticSize.s15)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s36)
            iconView.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s36)
        }
        
    }
}

