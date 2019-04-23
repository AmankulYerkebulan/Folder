
import Foundation
import UIKit

class IconImageViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "IconImageViewCell"
    
    private lazy var iconView:UIImageView = {
        let label = UIImageView()
        label.image = UIImage(named: "logo")
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

extension IconImageViewCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubViews(views: [iconView])
        self.backgroundColor = .clear
        self.iconView.snp.makeConstraints { (textFiled) in
            textFiled.width.equalTo(StaticSize.s118)
            textFiled.height.equalTo(StaticSize.s118)
            textFiled.centerX.equalTo(self.snp.centerX)
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s70)
            textFiled.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s57)
        }
    }
    
    func setUpTopConstrins() {
        self.iconView.snp.makeConstraints { (textFiled) in
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s20)
        }
    }
    
}

