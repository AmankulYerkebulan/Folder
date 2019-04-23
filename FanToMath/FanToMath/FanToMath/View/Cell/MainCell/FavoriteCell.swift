
import Foundation
import UIKit

class FavoriteCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "FavoriteCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.font = Global.comicSansFont(size: StaticSize.s17)
        label.textColor = Global.whiteColor()
        return label
    }()
    
    private lazy var sectionTitle:UILabel = {
        let label = UILabel()
        label.text = "Секция"
        label.textColor = Global.whiteColor()
        label.font = Global.comicSansFont(size: StaticSize.s11)
        return label
    }()
    
    private lazy var descriptionlbl:UILabel = {
        let label = UILabel()
        label.text = "Алгебра 8 класс (А.Г. Мерзляк, Д.А. Номировский, В.М. Поляков) «Графа»"
        label.textAlignment = .justified
        label.font = Global.comicSansFont(size: StaticSize.s11)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = Global.whiteColor()
        return label
    }()
    
    private lazy var iconView:UIImageView = {
        let label = UIImageView()
        label.layer.cornerRadius = 12
        label.image = UIImage(named: "star")
        return label
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsCellColor()
        view.layer.borderColor = Global.newsBorderColor().cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 12
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

extension FavoriteCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(mainView)
        self.mainView.addSubViews(views: [titleLbl,sectionTitle,descriptionlbl,iconView])
        
        self.iconView.snp.makeConstraints { (titleLbl) in
            titleLbl.right.equalTo(self.mainView.snp.right).offset(-(StaticSize.s14 - 1))
            titleLbl.top.equalTo(self.mainView.snp.top).offset(StaticSize.s14 - 1)
            titleLbl.height.equalTo(StaticSize.s20)
            titleLbl.width.equalTo(StaticSize.s20)
        }
        
        self.mainView.snp.makeConstraints { (iconView) in
            iconView.height.equalTo(StaticSize.s105)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s20)
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s20)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s20)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.left.equalTo(self.mainView.snp.left).offset(StaticSize.s14 - 1)
            titleLbl.top.equalTo(self.mainView.snp.top).offset(StaticSize.s14 - 1)
        }
        
        self.sectionTitle.snp.makeConstraints { (dayLbl) in
            dayLbl.left.equalTo(self.mainView.snp.left).offset(StaticSize.s14 - 1)
            dayLbl.top.equalTo(self.titleLbl.snp.bottom)
        }
        
        self.descriptionlbl.snp.makeConstraints { (descriptionlbl) in
            descriptionlbl.left.equalTo(self.mainView.snp.left).offset(StaticSize.s14 - 1)
            descriptionlbl.top.equalTo(self.sectionTitle.snp.bottom).offset(StaticSize.s8)
            descriptionlbl.right.equalTo(self.mainView.snp.right).offset(-(StaticSize.s14 - 1))
            descriptionlbl.bottom.equalTo(self.mainView.snp.bottom).offset(-(StaticSize.s8))
        }
        
    }
}

