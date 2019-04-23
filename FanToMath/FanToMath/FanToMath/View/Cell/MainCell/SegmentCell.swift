
import Foundation
import UIKit

class SegmentCell: UITableViewCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "SegmentCell"
    
    private lazy var segmentController:UISegmentedControl = {
        let items = ["Предметы".localized,"Тесты".localized]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged(event:)), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 4
        segmentedControl.backgroundColor = .clear
        let fontAttribute = [NSAttributedString.Key.font: Global.comicSansFont(size: StaticSize.s15)!,
                             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)] as [NSAttributedString.Key : Any]
        segmentedControl.setTitleTextAttributes(fontAttribute, for: .selected)
        segmentedControl.tintColor = Global.newsBorderColor()
        return segmentedControl
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

extension SegmentCell {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(self.segmentController)
        
        segmentController.snp.makeConstraints { (segmentController) in
            segmentController.top.equalTo(self.snp.top).offset(StaticSize.s20)
            segmentController.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s25)
            segmentController.height.equalTo(StaticSize.s36 + 2)
            segmentController.left.equalTo(self.snp.left).offset(StaticSize.s30)
            segmentController.right.equalTo(self.snp.right).offset(-StaticSize.s30)
        }
        
    }
    
    //MARK: - Action
    
    @objc private func indexChanged(event: UISegmentedControl) {
        NotificationCenter.default.post(name: .segmentPressed, object: event.selectedSegmentIndex)
    }
}

