
import Foundation
import UIKit
import SnapKit

class CustomAlert: UIView {
    
    //MARK: - Properties
    
    private lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s20)
        label.textAlignment = .center
        label.textColor = Global.greyColor()
        label.numberOfLines = 0
        label.text = "Вы действительно хотите убрать данную задачу из избранных?".localized
        return label
    }()
    
    private lazy var yesButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Да".localized, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Нет".localized, for: .normal)
        button.backgroundColor = Global.whiteColor()
        button.layer.borderWidth = 1
        button.layer.borderColor = Global.newsBorderColor().cgColor
        button.setTitleColor(Global.newsBorderColor(), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
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
        clipsToBounds = true
        
        setUpConstrains()
    }
}

extension CustomAlert: UITextViewDelegate {
    
    //MARK: - Setup
    
    private func setUpConstrains() {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.backgroundColor = Global.whiteColor()
        self.addSubViews(views: [descriptionLbl,yesButton,noButton])
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(StaticSize.s30 + 2)
            make.left.equalTo(self.snp.left).offset(StaticSize.s60 + 6)
            make.right.equalTo(self.snp.right).offset(-(StaticSize.s60 + 6))
        }
        
        noButton.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLbl.snp.bottom).offset(StaticSize.s30 + 2)
            make.right.equalTo(self.snp.centerX).offset(-StaticSize.s10)
            make.width.equalTo(StaticSize.s121 + 4)
            make.height.equalTo(StaticSize.s46)
            make.bottom.equalTo(self.snp.bottom).offset(-(StaticSize.s30 + 2))
        }
        
        yesButton.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLbl.snp.bottom).offset(StaticSize.s30 + 2)
            make.left.equalTo(self.snp.centerX).offset(StaticSize.s10)
            make.width.equalTo(StaticSize.s121 + 4)
            make.height.equalTo(StaticSize.s46)
            make.bottom.equalTo(self.snp.bottom).offset(-(StaticSize.s30 + 2))
        }
       
    }
    
    //MARK: - Action
    
    @objc private func buttonPressed(sender: CustomButton) {
        NotificationCenter.default.post(name: .savePressed, object: sender.titleLabel?.text?.localized)
    }
}

