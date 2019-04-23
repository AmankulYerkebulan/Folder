
import UIKit
import SnapKit

protocol CustomButtonDelegate : class {
    func buttonPressed(type: AuthorizationType?)
}

class AuthorizationView: UIView {
    
    //MARK: - Propertice
    
    var authtype         : AuthorizationType?
    
    private var delegate : CustomButtonDelegate?
        
    private lazy var saveButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Войти".localized, for: .normal)
        button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s28)
        label.text = "Логин".localized
        return label
    }()
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    private func commonInit() {
        
        self.setUp()
    }
}

extension AuthorizationView {
    
    //MARK: - Setup
    
    private func setUp() {
        
    }
    
    //MARK: - Action
    
    @objc private func signInPressed() {
        self.delegate?.buttonPressed(type: authtype)
    }
    
}
