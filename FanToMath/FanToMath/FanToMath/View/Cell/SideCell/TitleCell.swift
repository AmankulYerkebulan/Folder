
import Foundation
import UIKit

class TitleCell: UITableViewCell {
    
    //MARK: - Variables
    
    private let titleDictionary:[SideCellType:String] = [.one:"1 класс",.two:"2 класс",.three:"3 класс",.four:"4 класс",.five:"5 класс",.six:"6 класс",.seven:"7 класс",.eight:"8 класс",.nine:"9 класс",.ten:"10 класс",.eleven:"11 класс",.twelve:"12 класс",.other:"Другие",.favorite:"Избранное",.news:"Новости",.setting:"Настройки",.faq:"FAQ",.about:"О проекте",.logout:"Выйти"]
    
    private let titleDictionaryIcon:[SideCellType:UIImage] = [.one:UIImage(named: "1")!,.two:UIImage(named: "2")!,.three:UIImage(named: "3")!,.four:UIImage(named: "4")!,.five:UIImage(named: "5")!,.six:UIImage(named: "6")!,.seven:UIImage(named: "7")!,.eight:UIImage(named: "8")!,.nine:UIImage(named: "9")!,.ten:UIImage(named: "10")!,.eleven:UIImage(named: "11")!,.twelve:UIImage(named: "12")!,.other:UIImage(named: "other")!,.favorite:UIImage(named: "star")!,.news:UIImage(named: "news")!,.setting:UIImage(named: "setting")!,.faq:UIImage(named: "faq")!,.about:UIImage(named: "about")!,.logout:UIImage(named: "logout")!]
    
    static var cellIdentifier = "TitleCell"
    
    private lazy var iconView:UIImageView = {
        let label = UIImageView()
        return label
    }()
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "1 класс"
        label.font = Global.asinastraFont(size: StaticSize.s20)
        label.textColor = Global.whiteColor()
        return label
    }()
    
    private lazy var line1: UIView = {
        let view = UIView()
        view.backgroundColor = Global.greyLineColor()
        return view
    }()
    
    private lazy var line2: UIView = {
        let view = UIView()
        view.backgroundColor = Global.greyLineColor()
        return view
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

extension TitleCell {
    
    func setUptitle(type:SideCellType) {
        self.titleLbl.text = self.titleDictionary[type]
        self.iconView.image = self.titleDictionaryIcon[type]
        self.titleLbl.isHidden = (type == .empty)
        self.iconView.isHidden = (type == .empty)
    }
    
    private func setUp() {
        
//        self.selectionStyle = .none
        self.backgroundColor = Global.sideBlueColor()
        self.addSubViews(views: [iconView,titleLbl,line1,line2])
        
        self.line1.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s18)
            iconView.top.equalTo(self.snp.top)
            iconView.height.equalTo(1)
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s18)
        }
        
        self.iconView.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s20)
            iconView.height.equalTo(StaticSize.s20)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s26)
            iconView.top.equalTo(self.line1.snp.bottom).offset(8)
            iconView.bottom.equalTo(self.snp.bottom).offset(-8)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.centerY.equalTo(iconView.snp.centerY)
            titleLbl.left.equalTo(iconView.snp.right).offset(StaticSize.s12)
        }
        
        self.line2.snp.makeConstraints { (line2) in
            line2.left.equalTo(self.snp.left).offset(StaticSize.s18)
            line2.top.equalTo(self.iconView.snp.bottom).offset(StaticSize.s18)
            line2.height.equalTo(1)
            line2.right.equalTo(self.snp.right).offset(-StaticSize.s18)
            line2.bottom.equalTo(self.snp.bottom)
        }
    }
}

