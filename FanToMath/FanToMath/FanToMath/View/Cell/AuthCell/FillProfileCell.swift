
import Foundation
import UIKit

class FillProfileCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "FillProfileCell"
    
    lazy var button:UIButton = {
        let label = UIButton()
        label.layer.borderColor = Global.whiteColor().cgColor
        label.layer.cornerRadius = 2
        label.setTitleColor(Global.whiteColor(), for: .normal)
        label.titleLabel?.font = Global.asinastraFont(size: StaticSize.s20)
        label.titleLabel?.textAlignment = .center
        label.titleLabel?.numberOfLines = 0
        label.setTitle("Заполнить\nпрофиль".localized, for: .normal)
        label.layer.borderWidth = 1
        label.backgroundColor = .clear
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

extension FillProfileCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(button)
        
        self.button.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s121 - 2)
            iconView.height.equalTo(StaticSize.s57)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s18)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s28 + 1)
            iconView.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s30)
        }
        
    }
}

