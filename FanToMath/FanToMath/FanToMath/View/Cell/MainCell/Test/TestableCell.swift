
import Foundation
import UIKit

class TestableCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "TestableCell"
    
    var type = SettingType.setting
    
    var heightOfTableView:CGFloat = 0.0
    
    fileprivate var delegateManager = VariantManager()
    
    private lazy var question: CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.font = Global.comicSansFont(size: StaticSize.s20)
        label.text = "1. Вопрос\nКартинка или текст, вопрос на который нужно дать ответ."
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(VariantCell.self, forCellReuseIdentifier: VariantCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.logoBack()
        return tableView
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

extension TestableCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear

        self.addSubViews(views: [question,tableView])
        
        self.question.snp.makeConstraints { (iconView) in
            
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s55)
            iconView.top.equalTo(self.snp.top).offset(StaticSize.s10)
        }
        
        self.tableView.snp.makeConstraints { (iconView) in
            
            iconView.right.equalTo(self.snp.right).offset(-StaticSize.s55)
            iconView.left.equalTo(self.snp.left).offset(StaticSize.s55)
            iconView.top.equalTo(self.question.snp.bottom).offset(StaticSize.s22)
            iconView.bottom.equalTo(self.snp.bottom)
        }
        self.tableView.reloadData()
        
        let cells = self.tableView.visibleCells
        for cell in cells {
            print(cell.frame.height)
            heightOfTableView += cell.frame.height
        }
        
        self.tableView.snp.makeConstraints { (iconView) in
            iconView.height.equalTo( 4 * heightOfTableView)
        }
    }
}
