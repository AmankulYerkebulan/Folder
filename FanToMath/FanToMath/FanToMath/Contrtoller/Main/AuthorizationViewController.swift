
import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {
    
    //MARK: - Propertice
    
    var authType: AuthorizationType = .language
    
    fileprivate var delegateManager = AuthorizationManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IconImageViewCell.self, forCellReuseIdentifier: IconImageViewCell.cellIdentifier)
        tableView.register(CustomTextFieldCell.self, forCellReuseIdentifier: CustomTextFieldCell.cellIdentifier)
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.register(ForgorPasswordCell.self, forCellReuseIdentifier: ForgorPasswordCell.cellIdentifier)
        tableView.register(CustomButtonCell.self, forCellReuseIdentifier: CustomButtonCell.cellIdentifier)
        tableView.register(SignUpCell.self, forCellReuseIdentifier: SignUpCell.cellIdentifier)
        self.setUpDataSources()
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setUpObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.removeObserver()
    }
    
}

extension AuthorizationViewController {
    
    //MARK: - Set up
    
    private func setUpDataSources() {
        
        switch authType {
        case .signIn:
            self.delegateManager.array        = [[.icon],[.title],[.phone,.password],[.forgotPassword],[.button],[.signUp]]
            self.delegateManager.arraySection = [.icon,.title,.textFiled,.forgotPassword,.button,.signUp]
            self.delegateManager.typeAuth     = .signIn
        case .signUp:
            self.delegateManager.array        = [[.centerTitle],[.centerTitle],[.phone],[.button],[.signUp]]
            self.delegateManager.arraySection = [.title,.title,.textFiled,.button]
            self.delegateManager.typeAuth     = .signUp
        case .forgotPassword:
            self.delegateManager.array        = [[.title],[.phone],[.button]]
            self.delegateManager.arraySection = [.title,.textFiled,.button]
            self.delegateManager.typeAuth     = .forgotPassword
        case .newPassword:
            self.delegateManager.array        = [[.centerTitle],[.newPassword,.repeatPassword],[.button]]
            self.delegateManager.arraySection = [.title,.textFiled,.button]
            self.delegateManager.typeAuth     = .newPassword
        case .code:
            self.delegateManager.array        = [[.centerTitle],[.title],[.code],[.button]]
            self.delegateManager.arraySection = [.title,.title,.textFiled,.button]
            self.delegateManager.typeAuth     = .code
        case .language:
            self.delegateManager.array        = [[.centerTitle],[.button,.button,.button]]
            self.delegateManager.arraySection = [.title,.button]
            self.delegateManager.typeAuth     = .language
        case .limit:
            break
        case .share:
            break
        case .access:
            break
        case .listTranzation:
            break
        case .saveAndContinueProfile:
            break
        case .saveAndContinuePurchase:
            break
        case .startTest:
            break
        }
    
    }
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubViews(views: [tableView])
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
    }
    
    private func removeObserver() {
        
        NotificationCenter.default.removeObserver(self, name: .labelPressed, object: nil)
    }
    
    private func setUpObservers() {
        
        let origImage = UIImage(named: "leftarrow")!
        let tintedImage = origImage.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let bar = UIBarButtonItem(image: tintedImage, style: .plain, target: self, action: #selector(dismissPressed))
        bar.tintColor = Global.newsCellColor()
        if self.authType == .signIn || self.authType == .language {
            self.navigationItem.leftBarButtonItem = nil 
        } else {
            self.navigationItem.leftBarButtonItem = bar
        }
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        NotificationCenter.default.addObserver(self, selector: #selector(labelPressed(event:)), name: .labelPressed, object: nil)
    }
    
    private func goToMain() {
        
        let sideVC  = SideViewController()
        let frontVc = MainViewController()
        
        let frontNavC = UINavigationController(rootViewController: frontVc)
        
        guard let revealVc = SWRevealViewController (rearViewController: sideVC, frontViewController: frontNavC) else {return}
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            frontNavC.setupNavigatioBar()
            appDelegate.window?.rootViewController = revealVc
        }
    }
    
    //MARK: - Action
    
    @objc private func labelPressed(event: NSNotification) {
        
        if let _event = event.object as? AuthorizationType {
            
            if _event == .signIn {
                self.goToMain()
            }
            
            let vc = AuthorizationViewController()
            if _event == .language {
                if let _ = UIApplication.shared.delegate as? AppDelegate {
                    self.goToMain()
//                    vc.authType = .signIn
//                    let navVc = UINavigationController(rootViewController: vc)
//                    navVc.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//                    navVc.navigationBar.shadowImage = UIImage()
//                    navVc.navigationBar.isTranslucent = true
//                    appDelegate.window?.rootViewController = navVc
                }
            } else {
                vc.authType = _event
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc private func dismissPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

