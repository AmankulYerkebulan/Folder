
import UIKit

class ProblemViewController: UIViewController {
    
    //MARK: - Propertice
    
    fileprivate var delegateManager = ProblemViewManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ConditionViewCell.self, forCellReuseIdentifier: ConditionViewCell.cellIdentifier)
        tableView.register(DecisionVideoCell.self, forCellReuseIdentifier: DecisionVideoCell.cellIdentifier)
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.logoBack()
        return tableView
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.alpha = 0
        return view
    }()
    
    private lazy var customAlert: CustomAlertAddBook = {
        let view = CustomAlertAddBook()
        view.setUpTitle(title: "Сообщить", placeholder: "Введите описание ошибки")
        return view
    }()
    
    private lazy var customAlertFavorite: CustomAlert = {
        let view = CustomAlert()
        return view
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        NotificationCenter.default.addObserver(self, selector: #selector(sharePressed), name: .labelPressed, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorPressed), name: .faqSelected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(savePressedBook), name: .savePressedBook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(savePressed), name: .savePressed, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .labelPressed, object: nil)
        NotificationCenter.default.removeObserver(self, name: .faqSelected, object: nil)
        NotificationCenter.default.removeObserver(self, name: .savePressedBook, object: nil)
        NotificationCenter.default.removeObserver(self, name: .savePressed, object: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ProblemViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.navigationItem.title = "N 4298"
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubViews(views: [tableView])
        self.view.insertSubview(blurView, aboveSubview: tableView)
        
        blurView.addSubViews(views: [customAlertFavorite,customAlert])
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        customAlert.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.blurView.snp.top).offset(StaticSize.s194)
            collectionView.left.equalTo(self.blurView.snp.left).offset(StaticSize.s9)
            collectionView.right.equalTo(self.blurView.snp.right).offset(-StaticSize.s9)
        }
        customAlertFavorite.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.blurView.snp.top).offset(StaticSize.s194)
            collectionView.left.equalTo(self.blurView.snp.left).offset(StaticSize.s9)
            collectionView.right.equalTo(self.blurView.snp.right).offset(-StaticSize.s9)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star"), style: .plain, target: self, action: #selector(favoritePressed))
    }
    
    @objc private func sharePressed(sender: NSNotification) {
        
        if let type = sender.object as? AuthorizationType {
            if type == .share {
                let shareText = "Hello, world!"
                
                let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
                present(vc, animated: true)
            } else {
                let vc = SettingViewController()
                vc.type = .profile
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc private func errorPressed() {
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
            self.customAlertFavorite.isHidden = true
        }
    }
    
    @objc private func savePressedBook() {
        UIView.animate(withDuration: 0.2) {
            self.blurView.alpha = 0
        }
    }
    
    @objc private func favoritePressed() {
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
            self.customAlertFavorite.isHidden = false
            self.customAlert.isHidden = true
        }
    }
    
    @objc private func savePressed(sender: NSNotification) {
        if let sender = sender.object as? String {
            if sender == "Да".localized {
                UIView.animate(withDuration: 0.2, animations: {
                    self.blurView.alpha = 0
                }) { (success) in
                    self.customAlert.isHidden = false
                }
            } else {
                
                UIView.animate(withDuration: 0.2, animations: {
                     self.blurView.alpha = 0
                }) { (success) in
                     self.customAlert.isHidden = false
                }
            }
        }
    }
    
}
