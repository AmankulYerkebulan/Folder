
import Foundation
import UIKit

final class VariantManager: NSObject {
    
    override init() {
        super.init()
    }
}

extension VariantManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension VariantManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.variantCell(tableView: tableView, indexPath: indexPath)
    }
    
}

extension VariantManager {
    
    //MARK: - Helper
    
    private func variantCell(tableView: UITableView,indexPath: IndexPath) -> VariantCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VariantCell.cellIdentifier, for: indexPath) as! VariantCell
        return cell
    }
}
