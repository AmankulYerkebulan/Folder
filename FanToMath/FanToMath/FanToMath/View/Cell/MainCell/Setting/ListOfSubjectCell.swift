
import Foundation
import UIKit

class ListOfSubjectCell: UITableViewCell {
    
    //MARK: - Variables

    static var cellIdentifier = "ListOfSubjectCell"
    
    private lazy var title:UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s20)
        label.textColor = Global.newsBorderColor()
        label.text = "Алгебра 9 класс: Период"
        label.numberOfLines = 0
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

extension ListOfSubjectCell {
   
    private func setUp() {
        
        self.selectionStyle = .none
        self.addSubViews(views: [title])
        self.backgroundColor = .clear
        self.title.snp.makeConstraints { (textFiled) in
            textFiled.left.equalTo(self.snp.left).offset(StaticSize.s34)
            textFiled.right.equalTo(self.snp.right).offset(-StaticSize.s34)
            textFiled.top.equalTo(self.snp.top).offset(StaticSize.s20 + 1)
            textFiled.bottom.equalTo(self.snp.bottom)
        }
    }

}

