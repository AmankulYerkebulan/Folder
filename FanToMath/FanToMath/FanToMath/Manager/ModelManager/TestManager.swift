
import Foundation
import UIKit

final class TestManager: NSObject {
    
    var arraySection:[TestSection] = [.startTime,.question]
    
    override init() {
        super.init()
    }
}

extension TestManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension TestManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch arraySection[section] {
        case .startTime:
            return 1
        case .timeEnd:
            return 1
        case .result:
            return 1
        case .question:
            return 10
        case .description:
            return 1
        case .button:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch arraySection[indexPath.section] {
        case .startTime:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .timeEnd:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .result:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .question:
            return self.variantCell(tableView: tableView, indexPath: indexPath)
        case .description:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .button:
            return self.buttonCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
}

extension TestManager {
    
    //MARK: - Helper
    
    private func variantCell(tableView: UITableView,indexPath: IndexPath) -> TestableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestableCell.cellIdentifier, for: indexPath) as! TestableCell
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> CustomTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
        if arraySection[indexPath.section] == .startTime {
            cell.setUptestLabel(text: "\n15:00\n", centerTitle: .centerTitle, testSection: .startTime)
        } else if arraySection[indexPath.section] == .timeEnd {
            cell.setUptestLabel(text: "\nВремя: 15:00", centerTitle: .title, testSection: .timeEnd)
        } else if arraySection[indexPath.section] == .result {
            cell.setUptestLabel(text: "Результат 95/100", centerTitle: .title, testSection: .result)
        } else {
            cell.setUptestLabel(text: "\n\nОписание теста, дополнительная информация", centerTitle: .centerTitle, testSection: .description)
        }
        return cell
    }
    
    private func buttonCell(tableView: UITableView,indexPath: IndexPath) -> CustomButtonCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomButtonCell.cellIdentifier, for: indexPath) as! CustomButtonCell
        cell.typeAuth = .startTest
        cell.setUpTitle(index: indexPath.row)
        return cell
    }
    
}
