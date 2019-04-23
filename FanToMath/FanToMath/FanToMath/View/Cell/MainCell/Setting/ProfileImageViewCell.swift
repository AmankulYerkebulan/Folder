
import Foundation
import UIKit

class ProfileImageViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "ProfileImageViewCell"
    
    private lazy var iconView:UIButton = {
        let label = UIButton()
        label.backgroundColor = Global.whiteColor()
        label.layer.borderWidth = 1
        label.layer.borderColor = Global.newsBorderColor().cgColor
        label.setTitle("+", for: .normal)
        label.titleLabel?.font = Global.comicSansFont(size: StaticSize.s70)
        label.setTitleColor(Global.greyColor(), for: .normal)
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

extension ProfileImageViewCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(iconView)
        
        self.iconView.snp.makeConstraints { (iconView) in
            iconView.height.equalTo(StaticSize.s188 + 1)
            iconView.width.equalTo(StaticSize.s188 + 1)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s34)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s15)
            iconView.bottom.equalTo(self.snp.bottom)
        }
    }
}

