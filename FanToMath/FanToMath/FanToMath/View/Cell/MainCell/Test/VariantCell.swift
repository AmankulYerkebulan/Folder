
import Foundation
import UIKit

class VariantCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "VariantCell"
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s18 - 1)
        label.textColor = Global.blackColor()
        label.numberOfLines = 0
        label.text = "Вариант 1"
        return label
    }()
  
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
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

extension VariantCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [titleLbl,checkButton])
        
        self.titleLbl.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.checkButton.snp.right).offset(StaticSize.s12)
            iconView.right.equalTo(self.snp.right)
            iconView.centerY.equalTo(self.checkButton.snp.centerY)
        }
        
        self.checkButton.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left)
            iconView.width.equalTo(StaticSize.s23 + 1)
            iconView.height.equalTo(StaticSize.s23 + 1)
            iconView.top.equalTo(self.snp.top)
            iconView.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s22)
        }
        
    }
}

