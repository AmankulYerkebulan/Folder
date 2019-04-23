
import Foundation
import UIKit

protocol SideViewDelegate:class {
    func didSelectSide(type:SideCellType)
}

final class SideViewManager: NSObject {
    
    var array:[[SideCellType]]                          = [[.fillProfile],[.one,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.eleven,.twelve,.other,.empty,.favorite,.news,.setting,.faq,.about,.empty,.logout]]
    
    var arraySection:[SideSection] = [.fillProfile,.title]
    
    weak var delegate:SideViewDelegate?
    
    override init() {
        super.init()
    }
}

extension SideViewManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.didSelectSide(type: array[indexPath.section][indexPath.row])
    }

}

extension SideViewManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch arraySection[indexPath.section] {
        case .info:
            return self.infoUserCell(tableView: tableView, indexPath: indexPath)
        case .title:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .fillProfile:
            return self.fillProfileCell(tableView: tableView, indexPath: indexPath)
        case .signIn:
            return self.signInCell(tableView: tableView, indexPath: indexPath)
        }
    }
}

extension SideViewManager {
    
    //MARK: - Helper
    
    private func infoUserCell(tableView: UITableView,indexPath: IndexPath) -> UserinfoCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserinfoCell.cellIdentifier, for: indexPath) as! UserinfoCell
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.cellIdentifier, for: indexPath) as! TitleCell
        cell.setUptitle(type: self.array[indexPath.section][indexPath.row])
        return cell
    }
    
    private func fillProfileCell(tableView: UITableView,indexPath: IndexPath) -> FillProfileCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FillProfileCell.cellIdentifier, for: indexPath) as! FillProfileCell
        cell.button.addTarget(self, action: #selector(profilePressed), for: .touchUpInside)
        return cell
    }
    
    private func signInCell(tableView: UITableView,indexPath: IndexPath) -> SignInCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SignInCell.cellIdentifier, for: indexPath) as! SignInCell
        cell.button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        cell.icon.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        return cell
    }
    
    @objc private func profilePressed() {
        delegate?.didSelectSide(type: .fillProfile)
    }
    
    @objc private func signInPressed() {
        delegate?.didSelectSide(type: .signIn)
    }
    
}
