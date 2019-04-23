
import Foundation
import UIKit

class AboutProjectCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "AboutProjectCell"
    
    private lazy var descriptiontextView:UITextView = {
        let label = UITextView()
        label.text = "Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, Текстовое поле, "
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.textColor = Global.blackColor()
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

extension AboutProjectCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(descriptiontextView)
        self.backgroundColor = .clear
        self.descriptiontextView.snp.makeConstraints { (descriptionlbl) in
            descriptionlbl.left.equalTo(self.snp.left).offset(StaticSize.s20)
            descriptionlbl.top.equalTo(self.snp.top).offset(StaticSize.s20)
            descriptionlbl.height.equalTo(ScreenSize.SCREEN_HEIGHT)
            descriptionlbl.right.equalTo(self.snp.right).offset(-StaticSize.s20)
            descriptionlbl.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s20)
        }
        
    }
}

