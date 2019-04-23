
import UIKit

class SettingViewController: UIViewController {

    
    //MARK: - Propertice
    
    var type           = SettingType.setting
    
    var fromController = SettingType.setting
    
    fileprivate var delegateManager = SettingManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileImageViewCell.self, forCellReuseIdentifier: ProfileImageViewCell.cellIdentifier)
        tableView.register(CheckedViewCell.self, forCellReuseIdentifier: CheckedViewCell.cellIdentifier)
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.cellIdentifier)
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.register(CustomButtonCell.self, forCellReuseIdentifier: CustomButtonCell.cellIdentifier)
        tableView.register(ListOfSubjectCell.self, forCellReuseIdentifier: ListOfSubjectCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.logoBack()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        NotificationCenter.default.addObserver(self, selector: #selector(buttonPressed), name: .labelPressed, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .labelPressed, object: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension SettingViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        if type == .setting || self.fromController == .profile {
            self.setupRevealVC()
        }
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubViews(views: [tableView])
        if self.type == .setting {
            self.navigationItem.title = "Настройки".localized
        } else if self.type == .profile {
            self.navigationItem.title = "Заполнение профиля".localized
        } else if self.type == .purchase {
            self.navigationItem.title = "Выбор оплаты".localized
        }
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        if self.type == .purchase {
            self.delegateManager.type = self.type
            self.delegateManager.arraySection = [.location,.button]
            self.delegateManager.array = [[.levelclass,.language,.tarif,.purchaseType],[.button]]
        } else if self.type == .profile {
            self.delegateManager.type = self.type
            self.delegateManager.arraySection = [.info,.check,.location,.button]
            self.delegateManager.array = [[.phone,.name,.lastname],[.firstCheck,.secondCheck],[.oblast,.city,.school,.levelclass],[.button]]
        }
    }
    
    //MARK: - Action
    
    @objc private func buttonPressed(event: NSNotification) {
        
        if let type = event.object as? AuthorizationType {
            if type == .saveAndContinueProfile {
                if self.fromController != .profile {
                    let vc = SettingViewController()
                    vc.type = .purchase
                    self.navigationController?.pushViewController(vc, animated: true)
                } else if self.fromController == .profile {
                    let vc = MainViewController()
                    let frontVc = UINavigationController(rootViewController: vc)
                    vc.type = .news
                    WorkFlowManager.shared().isProfileSaved = true
                    self.revealViewController()?.pushFrontViewController(frontVc, animated: true)
                }
            } else if type == .saveAndContinuePurchase {
                //оплата
            }
        }
    }
}
