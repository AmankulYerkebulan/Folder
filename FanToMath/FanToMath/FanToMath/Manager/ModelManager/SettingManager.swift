
import Foundation
import UIKit

final class SettingManager: NSObject {
    
    var type = SettingType.setting
    
    var arraySection:[SettingSection] = [.profileImage,.info,.check,.location,.button,.changePasssword,.button,.title,.listTitle]
    
    var array:[[SettingCellType]] = [[.image],[.phone,.name,.lastname],[.firstCheck,.secondCheck],[.oblast,.city,.school,.levelclass,.language],[.button],[.newPaassword,.repatPassword],[.button],[.title],[.listTitle,.listTitle,.listTitle,.listTitle]]
    
    override init() {
        super.init()
    }
}

extension SettingManager: UITableViewDelegate {
    
    //MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: StaticSize.s60 + 3))
        let label = UILabel(frame: CGRect(x: StaticSize.s34, y: 0, width: ScreenSize.SCREEN_WIDTH, height: StaticSize.s60 + 3))
        label.backgroundColor = .clear
        label.font = Global.asinastraFont(size: StaticSize.s20)
        label.textColor = Global.greyColor()
        view.backgroundColor = .clear
        view.addSubview(label)
        if self.arraySection[section] == .profileImage {
            label.text = "Фото профиля".localized
            return view
        } else if self.arraySection[section] == .changePasssword {
            label.text = "Изменить пароль".localized
            return view
        }
        view.frame = .zero
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.arraySection[section] == .profileImage || self.arraySection[section] == .changePasssword {
            return StaticSize.s40
        }
        
        if self.arraySection[section] == .button {
            return StaticSize.s20
        }
        
        return 0
    }
    
}

extension SettingManager: UITableViewDataSource {
    
    //MARK: - Tableview Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch arraySection[indexPath.section] {
        
        case .profileImage:
            return self.profileImageCell(tableView: tableView, indexPath: indexPath)
        case .info:
            return self.infoCell(tableView: tableView, indexPath: indexPath)
        case .check:
            return self.checkCell(tableView: tableView, indexPath: indexPath)
        case .location:
            return self.infoCell(tableView: tableView, indexPath: indexPath)
        case .button:
            return self.buttonCell(tableView: tableView, indexPath: indexPath)
        case .changePasssword:
            return self.infoCell(tableView: tableView, indexPath: indexPath)
        case .title:
            return self.titleCell(tableView: tableView, indexPath: indexPath)
        case .listTitle:
            return self.listSubjectCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
}

extension SettingManager {
    
    //MARK: - Helper
    
    private func profileImageCell(tableView: UITableView,indexPath: IndexPath) -> ProfileImageViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageViewCell.cellIdentifier, for: indexPath) as! ProfileImageViewCell
        return cell
    }
    
    private func infoCell(tableView: UITableView,indexPath: IndexPath) -> TextFieldCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.cellIdentifier, for: indexPath) as! TextFieldCell
        cell.setUpPLaceholder(type: self.array[indexPath.section][indexPath.row])
        return cell
    }
    
    private func checkCell(tableView: UITableView,indexPath: IndexPath) -> CheckedViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CheckedViewCell.cellIdentifier, for: indexPath) as! CheckedViewCell
        cell.setUpTitle(type: self.array[indexPath.section][indexPath.row])
        return cell
    }
    
    private func listSubjectCell(tableView: UITableView,indexPath: IndexPath) -> ListOfSubjectCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfSubjectCell.cellIdentifier, for: indexPath) as! ListOfSubjectCell
        return cell
    }
    
    private func buttonCell(tableView: UITableView,indexPath: IndexPath) -> CustomButtonCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomButtonCell.cellIdentifier, for: indexPath) as! CustomButtonCell

        if self.type == .setting {
            cell.typeAuth = .newPassword
        } else if self.type == .purchase {
            cell.typeAuth = .saveAndContinuePurchase
        } else if self.type == .profile {
            cell.typeAuth = .saveAndContinueProfile
        }
        cell.setUpTitle(index: indexPath.row)
        return cell
    }
    
    private func titleCell(tableView: UITableView,indexPath: IndexPath) -> CustomTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTitleCell.cellIdentifier, for: indexPath) as! CustomTitleCell
        cell.setUpTextPlaceholder(title: .listTranzation,centerTitle: .centerTitle, section: indexPath.section)
        return cell
    }
    
}
