
import Foundation
import UIKit

class CheckedViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "CheckedViewCell"
    
    private lazy var firstLbl: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s18 - 1)
        label.textColor = Global.greyColor()
        return label
    }()
    
    private lazy var secondLbl: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s18 - 1)
        label.textColor = Global.greyColor()
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notcheck"), for: .normal)
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

extension CheckedViewCell {
    
    //MARK: - Setup
    
    func setUpTitle(type: SettingCellType) {
        if type == .firstCheck {
            self.firstLbl.text = "Ученик".localized
            self.secondLbl.text = "Родитель".localized
        } else if type == .secondCheck {
            self.firstLbl.text = "М".localized
            self.secondLbl.text = "Ж".localized
        }
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [firstLbl,secondLbl,firstButton,secondButton])
        
        self.firstLbl.snp.makeConstraints { (iconView) in
           
            iconView.right.equalTo(self.firstButton.snp.left).offset(-StaticSize.s15)
            iconView.centerY.equalTo(self.firstButton.snp.centerY)
        }
        
        self.secondLbl.snp.makeConstraints { (iconView) in
            
            iconView.right.equalTo(self.secondButton.snp.left).offset(-StaticSize.s15)
            iconView.centerY.equalTo(self.secondButton.snp.centerY)
        }
        
        self.firstButton.snp.makeConstraints { (iconView) in
            
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s121)
            iconView.width.equalTo(StaticSize.s23 + 1)
            iconView.height.equalTo(StaticSize.s23 + 1)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s22)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        
        self.secondButton.snp.makeConstraints { (iconView) in
            
            iconView.right.equalTo(self.snp.right).offset(-(StaticSize.s50 + 1))
            iconView.width.equalTo(StaticSize.s23 + 1)
            iconView.height.equalTo(StaticSize.s23 + 1)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s22)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        
    }
}

