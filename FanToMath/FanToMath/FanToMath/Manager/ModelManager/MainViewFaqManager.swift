
import Foundation
import UIKit
import ExpandableCell

final class MainViewFaqManager: NSObject {
    
    var type : SideCellType?
    
    var isSeleectedButton = false
    
    override init() {
        super.init()
    }
}

extension MainViewFaqManager: ExpandableDelegate {
    
    //MARK: - Tableview Delegate
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _type = self.type else {return UITableViewCell()}
        switch _type {
        case .faq:
            return self.faqCell(tableView: expandableTableView, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [UITableView.automaticDimension]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        
        return self.subCell(tableView: expandableTableView, indexPath: indexPath)
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        
        if isSeleectedButton == false {
            expandableTableView.closeAll()
            expandableTableView.open(at: indexPath)
        }
        self.isSeleectedButton = true
        expandableTableView.reloadData()
    }
}

extension MainViewFaqManager {
    
    //MARK: - Helper
    
    private func faqCell(tableView: ExpandableTableView,indexPath: IndexPath) -> FAQCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQCell.cellIdentifier, for: indexPath) as! FAQCell
        cell.mainView.tag = indexPath.row
        cell.arrawSet()
        return cell
    }
    
    private func subCell(tableView: ExpandableTableView,indexPath: IndexPath) -> [UITableViewCell]? {
        let cell = tableView.dequeueReusableCell(withIdentifier: FaqAnswerCell.cellIdentifier, for: indexPath) as! FaqAnswerCell
        return [cell]
    }
    
}
