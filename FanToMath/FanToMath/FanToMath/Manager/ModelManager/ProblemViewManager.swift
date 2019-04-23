
import Foundation
import UIKit

final class ProblemViewManager: NSObject {
    
    var array:[Problem] = [.problem,.decisionVideo,.error]
    
    override init() {
        super.init()
    }
}

extension ProblemViewManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
}

extension ProblemViewManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch array[indexPath.section] {
        case .problem:
            return self.problemCell(tableView: tableView, indexPath: indexPath, isDecision: false)
        case .decisionVideo:
            return self.decisionCell(tableView: tableView, indexPath: indexPath)
        case .button:
            return self.buttonCell(tableView: tableView, indexPath: indexPath)
        case .decisionText:
            return self.problemCell(tableView: tableView, indexPath: indexPath, isDecision: true)
        case .error:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        }
    }
}

extension ProblemViewManager {
    
    //MARK: - Helper
    
    private func decisionCell(tableView: UITableView,indexPath: IndexPath) -> DecisionVideoCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DecisionVideoCell.cellIdentifier, for: indexPath) as! DecisionVideoCell
        cell.isAccessToView(isAccess: true)
        return cell
    }
    
    private func problemCell(tableView: UITableView,indexPath: IndexPath,isDecision: Bool) -> ConditionViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConditionViewCell.cellIdentifier, for: indexPath) as! ConditionViewCell
        cell.hideTitle(isDecision: isDecision)
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> CustomTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
        cell.setUpTextPlaceholder(title: AuthorizationType.share,centerTitle: .centerTitle, section: indexPath.section)
        return cell
    }
    
    private func buttonCell(tableView: UITableView,indexPath: IndexPath) -> CustomButtonCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomButtonCell.cellIdentifier, for: indexPath) as! CustomButtonCell
        cell.typeAuth = .share
        cell.setUpTitle(index: indexPath.row)
        return cell
    }
    
}
