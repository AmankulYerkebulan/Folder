
import Foundation
import UIKit

final class MainViewManager: NSObject {
    
    var type         : SideCellType?
    
    private var news            : [News]?
    private var subjects        : [Subject]?
    private var indexOfSegmeent = 0
    
    override init() {
        super.init()
    }
}

extension MainViewManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if type == .news {
            NotificationCenter.default.post(name: .cellIsSelected, object: news?[indexPath.row])
        } else if self.isLevel() {
            NotificationCenter.default.post(name: .cellIsSelected, object: subjects?[indexPath.row])
        } else {
            NotificationCenter.default.post(name: .cellIsSelected, object: nil)
        }
    }
}

extension MainViewManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if type == .one || type == .two || type == .three || type == .four || type == .five || type == .six || type == .seven || type == .eight || type == .nine || type == .ten || type == .eleven || type == .twelve || type == .other {
            return 2
        }
        if self.type == .about {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.isLevel() && (section == 0 )) || (self.type == .about) {
            return 1
        }
        if type == .news {
            return self.news?.count ?? 0
        } else if self.isLevel() {
            return self.subjects?.count ?? 0
        }
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let _type = self.type else {return UITableViewCell()}
        if _type == .one || _type == .two || _type == .three || _type == .four || _type == .five || _type == .six || _type == .seven || _type == .eight || _type == .nine || _type == .ten || _type == .eleven || _type == .twelve || _type == .other {
            return self.testCell(tableView: tableView, indexPath: indexPath)
        }
        switch _type {
        case .news:
            return self.newsCell(tableView: tableView, indexPath: indexPath)
        case .favorite:
            return self.favoriteCell(tableView: tableView, indexPath: indexPath)
        case .about:
            return self.aboutProjectCell(tableView: tableView, indexPath: indexPath)
        case .faq:
            return self.faqCell(tableView: tableView, indexPath: indexPath)
        default:
            return self.newsCell(tableView: tableView, indexPath: indexPath)
        }
    }
}

extension MainViewManager {
    
    //MARK: - Helper
    
    private func newsCell(tableView: UITableView,indexPath: IndexPath) -> NewsCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellIdentifier, for: indexPath) as! NewsCell
        cell.setUpNewsInfo(new: self.news?[indexPath.row])
        return cell
    }
    
    private func favoriteCell(tableView: UITableView,indexPath: IndexPath) -> FavoriteCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.cellIdentifier, for: indexPath) as! FavoriteCell
        return cell
    }
    
    private func aboutProjectCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutProjectCell.cellIdentifier, for: indexPath) as! AboutProjectCell
            return cell
        } else if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: IconImageViewCell.cellIdentifier, for: indexPath) as! IconImageViewCell
            cell.setUpTopConstrins()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
            cell.setUpTitle()
            return cell
        }
    }
    
    private func testCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cellTest = tableView.dequeueReusableCell(withIdentifier: TestCell.cellIdentifier, for: indexPath) as! TestCell
            cellTest.hideFirstLine(index: indexPath.row)
            cellTest.setTitleOfSubect(suject: self.subjects?[indexPath.row])
            return cellTest
        }
        let cellSegment = tableView.dequeueReusableCell(withIdentifier: SegmentCell.cellIdentifier, for: indexPath) as! SegmentCell
        return cellSegment
    }
    
    private func faqCell(tableView: UITableView,indexPath: IndexPath) -> FAQCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQCell.cellIdentifier, for: indexPath) as! FAQCell
        return cell
    }

}

extension MainViewManager {
    
    //MARK: - Requestss
    
    func makeRequest(index: Int?) {
        if type == .news {
            WorkFlowManager.shared().allNews { (news) in
                self.news = news
                NotificationCenter.default.post(name: .reloadData, object: nil)
            }
        } else if self.isLevel() {
            self.indexOfSegmeent = index ?? 0
            if index == 0 {
                WorkFlowManager.shared().allSubjects(level: "\(type!.rawValue + 1)") { (subjects) in
                    self.subjects = subjects
                    NotificationCenter.default.post(name: .reloadData, object: nil)
                }
            } else {
                WorkFlowManager.shared().allTests(level: "\(type!.rawValue + 1)") { (subjects) in
                    self.subjects = subjects
                    NotificationCenter.default.post(name: .reloadData, object: nil)
                }
            }
        }
    }
    
    private func isLevel() -> Bool {
        if (type == .one || type == .two || type == .three || type == .four || type == .five || type == .six || type == .seven || type == .eight || type == .nine || type == .ten || type == .eleven || type == .twelve || type == .other) {
            return true
        }
        return false
    }
    
}
