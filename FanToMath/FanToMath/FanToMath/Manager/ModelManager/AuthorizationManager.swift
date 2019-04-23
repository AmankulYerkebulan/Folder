
import Foundation
import UIKit

final class AuthorizationManager: NSObject {
    
    var array:[[CellType]]                          = [[.icon],[.title],[.phone,.password],[.forgotPassword],[.button],[.signUp]]
    var arraySection:[AuthorizationSectionViewType] = [.icon,.title,.textFiled,.forgotPassword,.button,.signUp]
    
    var typeAuth                                    = AuthorizationType.signIn
    
    override init() {
        super.init()
    }
}

extension AuthorizationManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return Global.heightOfSection(typeAuth: self.typeAuth, section: section, arraySection: self.arraySection)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }
}

extension AuthorizationManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch arraySection[indexPath.section] {
        case .icon:
            return self.iconImageViewCell(tableView: tableView, indexPath: indexPath)
        case .signUp:
            return self.signUpCell(tableView: tableView, indexPath: indexPath)
        case .title:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .textFiled:
            return self.textFieldCell(tableView: tableView, indexPath: indexPath)
        case .forgotPassword:
            return self.forgotPasswordCell(tableView: tableView, indexPath: indexPath)
        case .button:
            return self.buttonCell(tableView: tableView, indexPath: indexPath)
        }
    }
}

extension AuthorizationManager {
    
    //MARK: - Helper
    
    private func iconImageViewCell(tableView: UITableView,indexPath: IndexPath) -> IconImageViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IconImageViewCell.cellIdentifier, for: indexPath) as! IconImageViewCell
        return cell
    }
    
    private func signUpCell(tableView: UITableView,indexPath: IndexPath) -> SignUpCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpCell.cellIdentifier, for: indexPath) as! SignUpCell
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> CustomTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
        cell.setUpTextPlaceholder(title: self.typeAuth,centerTitle: self.array[indexPath.section][indexPath.row], section: indexPath.section)
        return cell
    }
    
    private func textFieldCell(tableView: UITableView,indexPath: IndexPath) -> CustomTextFieldCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTextFieldCell.cellIdentifier, for: indexPath) as! CustomTextFieldCell
        cell.setUpTextFiledPlaceholder(title: array[indexPath.section][indexPath.row])
        return cell
    }
    
    private func forgotPasswordCell(tableView: UITableView,indexPath: IndexPath) -> ForgorPasswordCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForgorPasswordCell.cellIdentifier, for: indexPath) as! ForgorPasswordCell
        return cell
    }
    
    private func buttonCell(tableView: UITableView,indexPath: IndexPath) -> CustomButtonCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomButtonCell.cellIdentifier, for: indexPath) as! CustomButtonCell
        cell.typeAuth = self.typeAuth
        cell.setUpTitle(index: indexPath.row)
        return cell
    }

}
