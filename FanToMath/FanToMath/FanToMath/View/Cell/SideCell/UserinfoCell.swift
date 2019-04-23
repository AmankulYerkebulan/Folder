
import Foundation
import UIKit

class UserinfoCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "UserinfoCell"
    
    private lazy var iconView:UIImageView = {
        let label = UIImageView()
        label.image = UIImage(named: "city")
        label.layer.cornerRadius = StaticSize.s12
        label.layer.borderColor = Global.whiteColor().cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    private lazy var nameLbl:UILabel = {
        let label = UILabel()
        label.text = "Garry"
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.textColor = Global.whiteColor()
        return label
    }()
    
    private lazy var levelClassLbl:UILabel = {
        let label = UILabel()
        label.text = "7 class"
        label.font = Global.comicSansFont(size: StaticSize.s15)
        label.textColor = Global.whiteColor()
        return label
    }()
    
    private lazy var schoolLbl:UILabel = {
        let label = UILabel()
        label.text = "Гимназия 64"
        label.font = Global.comicSansFont(size: StaticSize.s11)
        label.textColor = Global.whiteColor()
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

extension UserinfoCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = Global.sideBlueColor()
        self.addSubViews(views: [iconView,nameLbl,levelClassLbl,schoolLbl])
        
        self.iconView.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s80)
            iconView.height.equalTo(StaticSize.s80)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s18)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s18)
            iconView.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s18)
        }
        self.schoolLbl.snp.makeConstraints { (schoolLbl) in
            schoolLbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s20)
            schoolLbl.bottom.equalTo(self.iconView.snp.bottom)
        }
        self.levelClassLbl.snp.makeConstraints { (levelClassLbl) in
            levelClassLbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s20)
            levelClassLbl.bottom.equalTo(self.schoolLbl.snp.top).offset(-4)
        }
        self.nameLbl.snp.makeConstraints { (nameLbl) in
            nameLbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s20)
            nameLbl.bottom.equalTo(self.levelClassLbl.snp.top).offset(-4)
        }
    }
}

