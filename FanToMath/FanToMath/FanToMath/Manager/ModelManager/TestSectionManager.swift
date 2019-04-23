
import Foundation
import UIKit

final class TestSectionManager: NSObject {
    
    var testSection:[TestSectionModel]?
    
    override init() {
        super.init()
    }
}

extension TestSectionManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .testSection, object: self.testSection?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return StaticSize.s20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }
    
}

extension TestSectionManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return testSection?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.variantCell(tableView: tableView, indexPath: indexPath)
    }
    
}

extension TestSectionManager {
    
    //MARK: - Helper
    
    private func variantCell(tableView: UITableView,indexPath: IndexPath) -> TestCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.cellIdentifier, for: indexPath) as! TestCell
        cell.setTitleOfTest(suject: self.testSection?[indexPath.row])
        cell.hideFirstLine(index: indexPath.row)
        return cell
    }

}
