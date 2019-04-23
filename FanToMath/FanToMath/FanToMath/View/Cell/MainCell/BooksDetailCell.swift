
import Foundation
import UIKit
import ExpandableCell

class BooksDetailCell: ExpandableCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "BooksDetailCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Название секции"
        label.font = Global.asinastraFont(size: StaticSize.s17)
        label.textColor = Global.newsBorderColor()
        return label
    }()
    
    private lazy var arrawImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "drop-down-arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var mainView: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = true
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(selected), for: .touchUpInside)
        return view
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 1.5
        view.layer.borderWidth = 1
        view.layer.borderColor = Global.newsBorderColor().cgColor
        return view
    }()
    
    override func isSelectable() -> Bool {
        return true
    }
    
    override func isInitiallyExpanded() -> Bool {
        return false
    }
    
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

extension BooksDetailCell {
    
    //MARK: - Setup
    
    func arrawSet() {
        if self.isExpanded() {
            self.arrawImage.image = UIImage(named: "open")
        } else {
            self.arrawImage.image = UIImage(named: "drop-down-arrow")
        }
    }
    
    private func setUp() {
        
        self.arrowImageView.isHidden = true
        self.backgroundColor = .clear
        self.addSubview(mainView)
        self.selectionStyle = .none
        self.mainView.addSubViews(views: [titleLbl,arrawImage,line])
        
        self.mainView.snp.makeConstraints { (mainView) in
            mainView.top.equalTo(self.snp.top).offset(StaticSize.s22)
            mainView.centerX.equalTo(self.snp.centerX)
            mainView.height.equalTo(StaticSize.s36)
            mainView.width.equalTo(ScreenSize.SCREEN_WIDTH - 2 * (StaticSize.s30+3))
            mainView.bottom.equalTo(self.snp.bottom)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.centerY.equalTo(self.mainView.snp.centerY)
            titleLbl.left.equalTo(self.mainView.snp.left).offset(StaticSize.s23)
        }
        
        self.arrawImage.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.mainView.snp.top).offset(StaticSize.s36 / 2 - 4.5)
            titleLbl.width.equalTo(10)
            titleLbl.height.equalTo(10)
            titleLbl.right.equalTo(self.mainView.snp.right).offset(-StaticSize.s23)
        }
        
        self.line.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.mainView.snp.bottom)
            titleLbl.left.equalTo(self.snp.left).offset(StaticSize.s30)
            titleLbl.height.equalTo(1)
            titleLbl.right.equalTo(self.snp.right).offset(-StaticSize.s8)
        }
        
    }
    
    //MARK: - Action
    
    @objc func selected(button: UIButton) {
        NotificationCenter.default.post(name: .faqSelected, object: button.tag)
    }
}

