
import Foundation
import UIKit

class FaqAnswerCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "FaqAnswerCell"
    
    private lazy var titleLbl:UILabel = {
        let label = UILabel()
        label.text = "Картинка или текст, ответ на вопрос, либо детальное описание решение проблемы"
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.textColor = Global.blackColor()
        return label
    }()
    
    private lazy var myimageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = 1.5
        view.isHidden = true
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

extension FaqAnswerCell {
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubViews(views: [titleLbl,myimageView])
        
        self.titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.snp.top).offset(StaticSize.s23)
            titleLbl.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s23)
            titleLbl.left.equalTo(self.snp.left).offset(StaticSize.s55)
            titleLbl.right.equalTo(self.snp.right).offset(-StaticSize.s55)
        }
        
        self.myimageView.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.snp.top).offset(StaticSize.s23)
            titleLbl.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s23)
            titleLbl.left.equalTo(self.snp.left).offset(StaticSize.s55)
            titleLbl.right.equalTo(self.snp.right).offset(-StaticSize.s55)
        }
        
    }
}

