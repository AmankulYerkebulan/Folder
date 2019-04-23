
import Foundation
import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "NewsCell"
    
    private lazy var iconView:UIImageView = {
        let label = UIImageView()
        label.layer.cornerRadius = 12
        label.image = UIImage(named: "city")
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.font = Global.comicSansFont(size: StaticSize.s17)
        label.textColor = Global.whiteColor()
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var dayLbl:UILabel = {
        let label = UILabel()
        label.text = "12.10.19"
        label.textColor = Global.whiteColor()
        label.font = Global.comicSansFont(size: StaticSize.s11)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionlbl:UILabel = {
        let label = UILabel()
        label.text = "Текст новости который будет отображаться в ленте новостей. Текст новости который будет отображаться в ленте новостей. "
        label.textAlignment = .justified
        label.font = Global.comicSansFont(size: StaticSize.s11)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = Global.whiteColor()
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

extension NewsCell {
    
    //MARK: - Setup
    
    func setUpNewsInfo(new: News?) {
        if  let _new        = new,
            let title       = _new.title,
            let description = _new.description,
            let iconView    = _new.image,
            let date        = _new.date {
            self.iconView.kf.setImage(with: iconView)
            self.titleLbl.text       = title
            self.descriptionlbl.text = description
            self.dayLbl.text         = date
        }
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(mainView)
        self.mainView.addSubViews(views: [iconView,titleLbl,dayLbl,descriptionlbl])
        
        self.mainView.snp.makeConstraints { (iconView) in
            iconView.height.equalTo(StaticSize.s140 + 1)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s20)
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s20)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s20)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        
        self.iconView.snp.makeConstraints { (iconView) in
            iconView.width.equalTo(StaticSize.s138)
            iconView.height.equalTo(StaticSize.s115)
            iconView.left.equalTo(self.mainView.snp.left).offset(StaticSize.s14 - 1)
            iconView.top.equalTo(self.mainView.snp.top).offset(StaticSize.s14 - 1)
            iconView.bottom.equalTo(self.mainView.snp.bottom).offset(-(StaticSize.s14 - 1))
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s14 - 1)
            titleLbl.top.equalTo(self.iconView.snp.top)
            titleLbl.right.equalTo(self.mainView.snp.right).offset(-(StaticSize.s14 - 1))
        }
        
        self.dayLbl.snp.makeConstraints { (dayLbl) in
            dayLbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s14 - 1)
            dayLbl.top.equalTo(self.titleLbl.snp.bottom)
            dayLbl.right.equalTo(self.mainView.snp.right).offset(-(StaticSize.s14 - 1))
        }
        
        self.descriptionlbl.snp.makeConstraints { (descriptionlbl) in
            descriptionlbl.left.equalTo(self.iconView.snp.right).offset(StaticSize.s14 - 1)
            descriptionlbl.top.equalTo(self.dayLbl.snp.bottom).offset(StaticSize.s8)
            descriptionlbl.right.equalTo(self.mainView.snp.right).offset(-(StaticSize.s14 - 1))
            descriptionlbl.bottom.equalTo(self.iconView.snp.bottom)
        }
        
    }
}

