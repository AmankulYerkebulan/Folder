
import Foundation
import UIKit

class SignUpCell: UITableViewCell {
    
    //MARK: - Variables
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация".localized
        label.isUserInteractionEnabled = true
        label.font = Global.asinastraFont(size: StaticSize.s11)
        label.textColor = Global.blueColor()
        return label
    }()
    
    static var cellIdentifier = "SignUpCell"
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
    
}

extension SignUpCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubview(signUpLabel)
        self.tappableLabel()
        self.backgroundColor = .clear
        self.signUpLabel.snp.makeConstraints { (signUpLabel) in
            signUpLabel.centerX.equalTo(self.snp.centerX)
            signUpLabel.top.equalTo(self.snp.top).offset(StaticSize.s28)
            signUpLabel.bottom.equalTo(self.snp.bottom)
        }
    }
    
    private func tappableLabel() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLabelToWebPage(gesture:)))
        self.signUpLabel.addGestureRecognizer(tapGesture)
        
        let text = NSLocalizedString("\((self.signUpLabel.text)!)", comment: "")
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        print("Text:\(text)")
        
        let range1 = (text as NSString).range(of: "Регистрация".localized)
        
        underlineAttriString.addAttribute(kCTUnderlineStyleAttributeName as NSAttributedString.Key, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.setColorForText(textForAttribute:"sign up".localized, withColor: Global.blueColor())
        
        self.signUpLabel.attributedText = underlineAttriString
    }
    
    @objc func tapLabelToWebPage(gesture: UITapGestureRecognizer) {
        
        let text = NSLocalizedString("\((self.signUpLabel.text)!)", comment: "")
        
        let signUp = (text as NSString).range(of: "Регистрация".localized)
        
        if gesture.didTapAttributedTextInLabel(label: self.signUpLabel, inRange: signUp) {
            print("Sign up pressed")
            NotificationCenter.default.post(name: .labelPressed, object: AuthorizationType.signUp)
        }
    }
    
}
