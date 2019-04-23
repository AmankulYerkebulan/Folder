
import UIKit

class SideViewController: UIViewController {

    //MARK: - Propertice
    
    fileprivate var delegateManager = SideViewManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserinfoCell.self, forCellReuseIdentifier: UserinfoCell.cellIdentifier)
        tableView.register(FillProfileCell.self, forCellReuseIdentifier: FillProfileCell.cellIdentifier)
        tableView.register(SignInCell.self, forCellReuseIdentifier: SignInCell.cellIdentifier)
        tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.backgroundColor = Global.sideBlueColor()
        return tableView
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.revealViewController().view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.revealViewController().tapGestureRecognizer()
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = false
        navigationController?.navigationBar.barStyle = .black
        
        if WorkFlowManager.shared().isProfileSaved == true {
            self.delegateManager.array = [[.info],[.one,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.eleven,.twelve,.other,.empty,.favorite,.news,.setting,.faq,.about,.empty,.logout]]
            self.delegateManager.arraySection = [.info,.title]
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    
        self.revealViewController().frontViewController.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension SideViewController {
    
    //MARK: - Setups
    
    private func setUp() {
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "side")!)
        self.view.addSubViews(views: [tableView])
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        self.delegateManager.delegate = self
        configureRevealForSideMenu()
    }
    
    private func configureRevealForSideMenu() {
        
        self.revealViewController().toggleAnimationType = SWRevealToggleAnimationType (rawValue: 0)!
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 174
        self.revealViewController().rearViewRevealOverdraw = 0
        self.revealViewController().rightViewRevealOverdraw = 0
    }
}

extension SideViewController:SideViewDelegate  {
    
    func didSelectSide(type: SideCellType) {
        
        let vc = MainViewController()
        let frontVc = UINavigationController(rootViewController: vc)
        vc.type = type
        
        if type == .one || type == .two || type == .three || type == .four || type == .five || type == .six || type == .seven || type == .eight || type == .nine || type == .ten || type == .eleven || type == .twelve || type == .other {
            self.aboutPressed(vc: vc, navVc: frontVc)
            return
        }
        
        switch type {
        case .setting:
            self.settingPressed()
        case .news:
            self.newsPressed(vc: vc, navVc: frontVc)
        case .favorite:
            self.favoritePressed(vc: vc, navVc: frontVc)
        case .about:
            self.aboutPressed(vc: vc, navVc: frontVc)
        case .faq:
            self.aboutPressed(vc: vc, navVc: frontVc)
        case .fillProfile:
            self.fillProfile()
        case .signIn:
            self.signInPressed()
        case .logout:
            self.logout(vc: vc, navVc: frontVc)
        default:
            break
        }
    }
    
    private func settingPressed() {
        let vc = SettingViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.revealViewController()?.pushFrontViewController(nav, animated: true)
    }
    
    private func newsPressed(vc: MainViewController,navVc: UINavigationController) {
        self.revealViewController()?.pushFrontViewController(navVc, animated: true)
    }
    
    private func favoritePressed(vc: MainViewController,navVc: UINavigationController) {
        self.revealViewController()?.pushFrontViewController(navVc, animated: true)
    }
    
    private func aboutPressed(vc: MainViewController,navVc: UINavigationController) {
        self.revealViewController()?.pushFrontViewController(navVc, animated: true)
    }
    
    private func logout(vc: MainViewController,navVc: UINavigationController) {
        WorkFlowManager.shared().isProfileSaved = false
        self.delegateManager.array = [[.signIn],[.one,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.eleven,.twelve,.other,.empty,.favorite,.news,.setting,.faq,.about,.empty]]
        self.delegateManager.arraySection = [.signIn,.title]
        self.tableView.reloadData()
        self.revealViewController()?.pushFrontViewController(navVc, animated: true)
    }
    
    private func fillProfile() {
        let vc = SettingViewController()
        vc.type = .profile
        vc.fromController = .profile
        let nav = UINavigationController(rootViewController: vc)
        self.revealViewController()?.pushFrontViewController(nav, animated: true)
    }
    
    private func signInPressed() {
        let vc = AuthorizationViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.authType = .signIn
        self.revealViewController()?.pushFrontViewController(nav, animated: true)
    }
    
}
