
import Foundation
import UIKit
import ExpandableCell

final class DetailBooksManager: NSObject {
        
    var isSeleectedButton = false
    
    override init() {
        super.init()
    }
}

extension DetailBooksManager: ExpandableDelegate {
    
    //MARK: - Tableview Delegate
    
    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int {
        return 3
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            return self.buttonCell(tableView: expandableTableView, indexPath: indexPath)
        } else if indexPath.section == 0 {
            return self.titleCell(tableView: expandableTableView, indexPath: indexPath)
        }
        
        return self.booksDetailCell(tableView: expandableTableView, indexPath: indexPath)
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 || section == 0 {
            return 1
        }
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

extension DetailBooksManager {
    
    //MARK: - Helper
    
    private func booksDetailCell(tableView: ExpandableTableView,indexPath: IndexPath) -> BooksDetailCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksDetailCell.cellIdentifier, for: indexPath) as! BooksDetailCell
        cell.mainView.tag = indexPath.row
        cell.arrawSet()
        return cell
    }
    
    
    
    private func subCell(tableView: ExpandableTableView,indexPath: IndexPath) -> [UITableViewCell]? {
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksDetailCollectionViewCell.cellIdentifier, for: indexPath) as! BooksDetailCollectionViewCell
        cell.setUpHeight(height: 4 * StaticSize.s60 + 4 * 14)
        return [cell]
    }
    
    private func buttonCell(tableView: UITableView,indexPath: IndexPath) -> CustomButtonCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomButtonCell.cellIdentifier, for: indexPath) as! CustomButtonCell
        cell.typeAuth = .limit
        cell.setUpTitle(index: indexPath.row)
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> CustomTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
        cell.setUpTextPlaceholder(title: .limit,centerTitle: .centerTitle, section: indexPath.section)
        return cell
    }
    
}
