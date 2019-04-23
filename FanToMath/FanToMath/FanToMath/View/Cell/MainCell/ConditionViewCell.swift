
import Foundation
import UIKit

class ConditionViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "ConditionViewCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Условие задачи".localized
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.textColor = Global.newsBorderColor()
        return label
    }()
    
    private lazy var line1: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private lazy var conditionLbl: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .justified
        view.font = Global.comicSansFont(size: StaticSize.s16)
        view.text = "Сложная функция (суперпозиция функций). Пусть y = f (x) – чи-словая функция с областью определения D ( f ) и областью изменения (множеством значений) E ( f ), а – числовая функция, заданная на мно- жестве E ( f ) или некотором его подмножестве, с областью изменения"
        return view
    }()
    
    private lazy var conditionView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH - StaticSize.s8, height: 2))
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.5
        view.backgroundColor = Global.whiteColor()
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

extension ConditionViewCell {
 
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [titleLbl,line1,conditionView])
        self.conditionView.addSubview(conditionLbl)
        
        self.line1.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.titleLbl.snp.left)
            iconView.top.equalTo(self.titleLbl.snp.bottom).offset(5)
            iconView.height.equalTo(1)
            iconView.right.equalTo(self.snp.right)
        }
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.snp.top).offset(StaticSize.s23)
            titleLbl.left.equalTo(self.snp.left).offset(StaticSize.s36 + 3)
        }
        
        self.conditionView.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.snp.left).offset(8)
            iconView.top.equalTo(self.line1.snp.bottom).offset(8)
            iconView.right.equalTo(self.snp.right).offset(-8)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        
        self.conditionLbl.snp.makeConstraints { (iconView) in
            iconView.left.equalTo(self.conditionView.snp.left).offset(12)
            iconView.top.equalTo(self.conditionView.snp.top).offset(8)
            iconView.right.equalTo(self.conditionView.snp.right).offset(-12)
            iconView.bottom.equalTo(self.conditionView.snp.bottom).offset(-8)
        }
    }
    
    func hideTitle(isDecision: Bool) {
        
        if isDecision == true {
            self.titleLbl.isHidden = isDecision
            self.line1.isHidden = isDecision
            self.conditionView.snp.makeConstraints { (iconView) in
                iconView.left.equalTo(self.snp.left).offset(8)
                iconView.top.equalTo(self.snp.top).offset(StaticSize.s16)
                iconView.right.equalTo(self.snp.right).offset(-8)
                iconView.bottom.equalTo(self.snp.bottom)
            }
        }
    }
    
}

