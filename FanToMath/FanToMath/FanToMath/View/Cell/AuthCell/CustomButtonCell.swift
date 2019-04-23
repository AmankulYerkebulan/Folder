
import Foundation
import UIKit
import SnapKit

class CustomButtonCell: UITableViewCell {
    
    //MARK: - Variables
    
    var typeAuth              = AuthorizationType.signIn
    
    static var cellIdentifier = "CustomButtonCell"
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton()
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
    
}

extension CustomButtonCell {
    
    //MARK: - Setup
 
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubview(loginButton)
        self.backgroundColor = .clear
        self.loginButton.snp.makeConstraints { (loginButton) in
            loginButton.left.equalTo(self.snp.left).offset(StaticSize.s55)
            loginButton.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            loginButton.height.equalTo(StaticSize.s46)
            loginButton.top.equalTo(self.snp.top).offset(StaticSize.s12)
            loginButton.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s12)
        }
    }
}

extension CustomButtonCell {
    
    //MARK: - Setup
    
    func setUpTitle(index: Int) {
        switch typeAuth {
        case .signIn:
            self.loginButton.setTitle("Войти".localized, for: .normal)
        case .code:
            self.loginButton.setTitle("Далее".localized, for: .normal)
        case .forgotPassword:
            self.loginButton.setTitle("Отправить код".localized, for: .normal)
        case .newPassword:
            self.loginButton.setTitle("Сохранить".localized, for: .normal)
        case .signUp:
            self.loginButton.setTitle("Регистрация".localized, for: .normal)
        case .language:
            switch index {
            case 0:
                self.loginButton.setTitle("Қазакша", for: .normal)
            case 1:
                self.loginButton.setTitle("Руский", for: .normal)
            case 2:
                self.loginButton.setTitle("English", for: .normal)
            default:
                break
            }
        case .limit:
            self.loginButton.setTitle("Открыть доступ на все задачи".localized, for: .normal)
        case .share:
            self.loginButton.setTitle("ПОДЕЛИТЬСЯ С ДРУГОМ".localized, for: .normal)
        case .access:
            self.loginButton.setTitle("Получить доступ".localized, for: .normal)
        case .listTranzation:
            self.loginButton.setTitle("Сохранить".localized, for: .normal)
        case .saveAndContinuePurchase:
            self.loginButton.setTitle("Сохранить и продалжить".localized, for: .normal)
        case .saveAndContinueProfile:
            self.loginButton.setTitle("Сохранить и продалжить".localized, for: .normal)
        case .startTest:
            self.loginButton.setTitle("Начать тестирование".localized, for: .normal)
        }
        
        if typeAuth == .limit {
            self.loginButton.snp.makeConstraints { (loginButton) in
                loginButton.left.equalTo(self.snp.left).offset(StaticSize.s40)
                loginButton.right.equalTo(self.snp.right).offset(-StaticSize.s40)
                loginButton.height.equalTo(StaticSize.s46)
                loginButton.top.equalTo(self.snp.top).offset(StaticSize.s12)
                loginButton.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s12)
            }
        }
    }
    
    //MARK: - Actions
    
    @objc private func loginPressed() {
        switch typeAuth {
        case .signIn:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.signIn)
        case .code:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.newPassword)
        case .signUp:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.code)
        case .forgotPassword:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.code)
        case .newPassword:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.signIn)
        case .language:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.language)
        case .limit:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.limit)
        case .share:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.share)
        case .access:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.access)
        case .listTranzation:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.listTranzation)
        case .saveAndContinueProfile:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.saveAndContinueProfile)
        case .saveAndContinuePurchase:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.saveAndContinuePurchase)
        case .startTest:
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.startTest)
        }
    }

}
