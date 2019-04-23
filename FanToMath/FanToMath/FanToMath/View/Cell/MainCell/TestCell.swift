
import Foundation
import UIKit

class TestCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "TestCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Тест НИШ"
        label.font = Global.comicSansFont(size: StaticSize.s25)
        label.textColor = Global.newsBorderColor()
        return label
    }()
    
    private lazy var line1: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private lazy var line2: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = 1.5
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

extension TestCell {
    
    func hideFirstLine(index: Int) {
        self.line1.isHidden = (index != 0)
    }
    
    func setTitleOfSubect(suject: Subject?) {
        if let _subject = suject,
            let title = _subject.name {
            self.titleLbl.text = title
        }
    }
    
    func setTitleOfTest(suject: TestSectionModel?) {
        if let _subject = suject,
            let title = _subject.name {
            self.titleLbl.text = title
        }
    }
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [titleLbl,line1,line2])
        
        self.line1.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s30)
            iconView.top.equalTo(self.snp.top)
            iconView.height.equalTo(1.5)
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s30)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(line1.snp.bottom).offset(StaticSize.s16)
            titleLbl.centerX.equalTo(self.snp.centerX)
        }
        
        self.line2.snp.makeConstraints { (line2) in
            line2.left.equalTo(self.snp.left).offset(StaticSize.s30)
            line2.top.equalTo(self.titleLbl.snp.bottom).offset(StaticSize.s16)
            line2.height.equalTo(1.5)
            line2.right.equalTo(self.snp.right).offset(-StaticSize.s30)
            line2.bottom.equalTo(self.snp.bottom)
        }
    }
}

