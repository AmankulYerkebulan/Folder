
import Foundation
import UIKit

class DecisionVideoCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "DecisionVideoCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Решение".localized
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.textColor = Global.newsBorderColor()
        return label
    }()
    
    private lazy var line1: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private lazy var conditionView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.image = UIImage(named: "city")
        return view
    }()
    
    private lazy var playButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "play"), for: .normal)
        return view
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.3529411765, blue: 0.5529411765, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var accessButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Получить доступ".localized, for: .normal)
        button.addTarget(self, action: #selector(accessPressed), for: .touchUpInside)
        button.layer.borderColor = Global.blueColor().cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = Global.whiteColor()
        button.setTitleColor(Global.greyColor(), for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Поделиться с другом", for: .normal)
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var conditionLbl: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .justified
        view.font = Global.comicSansFont(size: StaticSize.s16)
        view.text = "Сложная функция (суперпозиция функций). Пусть y = f (x) – чи-словая функция с областью определения D ( f ) и областью изменения (множеством значений) E ( f ), а – числовая функция, заданная на мно- жестве E ( f ) или некотором его подмножестве, с областью изменения"
        return view
    }()
    
    private lazy var conditiontextView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.5
        view.backgroundColor = Global.whiteColor()
        return view
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


extension DecisionVideoCell {
    
    //MARK: - Setup
    
    func isAccessToView(isAccess: Bool) {
        self.blurView.isHidden = isAccess
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [titleLbl,line1,conditionView,loginButton,conditiontextView])
        self.insertSubview(blurView, aboveSubview: conditionLbl)
        self.conditionView.addSubview(playButton)
        self.conditiontextView.addSubview(conditionLbl)
        self.blurView.addSubview(accessButton)
        self.line1.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.titleLbl.snp.left)
            iconView.top.equalTo(self.titleLbl.snp.bottom).offset(5)
            iconView.height.equalTo(1)
            iconView.right.equalTo(self.snp.right)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.snp.top).offset(StaticSize.s23)
            titleLbl.left.equalTo(self.snp.left).offset(StaticSize.s36 + 3)
        }
        
        self.conditionView.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left).offset(8)
            iconView.top.equalTo(self.line1.snp.bottom).offset(8)
            iconView.right.equalTo(self.snp.right).offset(-8)
            iconView.height.equalTo(StaticSize.s276)
        }
        
        self.playButton.snp.makeConstraints { (iconView) in
            iconView.height.equalTo(StaticSize.s57 + 1)
            iconView.width.equalTo(StaticSize.s55 + 1)
            iconView.centerY.equalTo(self.conditionView.snp.centerY).offset((StaticSize.s57 + 1) / 2)
            iconView.centerX.equalTo(self.conditionView.snp.centerX)
        }
        
        self.loginButton.snp.makeConstraints { (loginButton) in
            loginButton.left.equalTo(self.snp.left).offset(StaticSize.s55)
            loginButton.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            loginButton.height.equalTo(StaticSize.s46)
            loginButton.top.equalTo(self.conditionView.snp.bottom).offset(StaticSize.s23)
        }
        
        self.conditiontextView.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left).offset(8)
            iconView.top.equalTo(self.loginButton.snp.bottom).offset(StaticSize.s23)
            iconView.right.equalTo(self.snp.right).offset(-8)
            iconView.bottom.equalTo(self.snp.bottom).offset(-10)
        }

        self.conditionLbl.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.conditiontextView.snp.left).offset(12)
            iconView.top.equalTo(self.conditiontextView.snp.top).offset(8)
            iconView.right.equalTo(self.conditiontextView.snp.right).offset(-12)
            iconView.bottom.equalTo(self.conditiontextView.snp.bottom).offset(-8)
        }
        
        self.blurView.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.conditiontextView.snp.left)
            iconView.top.equalTo(self.conditionView.snp.top)
            iconView.right.equalTo(self.conditiontextView.snp.right)
            iconView.bottom.equalTo(self.conditiontextView.snp.bottom)
        }
        
        self.accessButton.snp.makeConstraints { (loginButton) in
            loginButton.left.equalTo(self.snp.left).offset(StaticSize.s55)
            loginButton.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            loginButton.height.equalTo(StaticSize.s46)
            loginButton.bottom.equalTo(self.blurView.snp.bottom).offset(-StaticSize.s115)
        }
        
    }
    
    @objc private func loginPressed() {
        NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.share)
    }
    
    @objc private func accessPressed() {
        NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.access)
    }
    
}

