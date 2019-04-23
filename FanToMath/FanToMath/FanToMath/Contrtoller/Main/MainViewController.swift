
import UIKit
import ExpandableCell

class MainViewController: UIViewController {

    //MARK: - Propertice
    
    var type                           = SideCellType.news
    
    private var selectedIndex:Int?     = nil
    
    fileprivate var delegateManager    = MainViewManager()
    fileprivate var faqDelegateManager = MainViewFaqManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.cellIdentifier)
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.cellIdentifier)
        tableView.register(AboutProjectCell.self, forCellReuseIdentifier: AboutProjectCell.cellIdentifier)
        tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.cellIdentifier)
        tableView.register(SegmentCell.self, forCellReuseIdentifier: SegmentCell.cellIdentifier)
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.register(IconImageViewCell.self, forCellReuseIdentifier: IconImageViewCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isHidden = (self.type == .faq)
        tableView.logoBack()
        return tableView
    }()
    
    private lazy var expandableTableView: ExpandableTableView = {
        let tableView = ExpandableTableView()
        tableView.register(FAQCell.self, forCellReuseIdentifier: FAQCell.cellIdentifier)
        tableView.register(FaqAnswerCell.self, forCellReuseIdentifier: FaqAnswerCell.cellIdentifier)
        tableView.expandableDelegate = self.faqDelegateManager
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isHidden = (self.type != .faq)
        tableView.animation = .automatic
        tableView.logoBack()
        return tableView
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupRevealVC()
        self.setUp()
        self.delegateManager.makeRequest(index: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.removeObservers()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension MainViewController {
    
    //MARK: - Setup
    
    private func addObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .reloadData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(segmentChange), name: .segmentPressed, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(faqisSelected), name: .faqSelected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didSeleced), name: .cellIsSelected, object: nil)
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func removeObservers() {
        
        NotificationCenter.default.removeObserver(self, name: .reloadData, object: nil)
        NotificationCenter.default.removeObserver(self, name: .segmentPressed, object: nil)
        NotificationCenter.default.removeObserver(self, name: .faqSelected, object: nil)
        NotificationCenter.default.removeObserver(self, name: .cellIsSelected, object: nil)
    }
    
    private func setUp() {
                
        self.delegateManager.type = self.type == .faq ? nil : self.type
        self.faqDelegateManager.type = self.type != .faq ? nil : self.type
        self.view.backgroundColor = Global.whiteColor()
        setNeedsStatusBarAppearanceUpdate()
        self.title = Global.titleDictionary[type]
        self.view.addSubViews(views: [tableView,expandableTableView])
        
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        
        self.expandableTableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        
        if (type == .one || type == .two || type == .three || type == .four || type == .five || type == .six || type == .seven || type == .eight || type == .nine || type == .ten || type == .eleven || type == .twelve || type == .other) {
            self.title = "Предметы".localized
        }
    }
    
    //MARK: - Action
    
    @objc private func segmentChange(index: NSNotification) {
        if let _index = index.object as? Int {
            switch _index {
            case 0:
                self.title = "Предметы".localized
                self.delegateManager.makeRequest(index: 0)
            default:
                self.title = "Тесты".localized
                self.delegateManager.makeRequest(index: 1)
            }
        }
    }
    
    @objc private func faqisSelected(sender: NSNotification) {
        guard let row = sender.object as? Int else {return}
        self.faqDelegateManager.isSeleectedButton = self.selectedIndex == row
        self.selectedIndex = row
        let indexPath = IndexPath(row: row, section: 0)
        expandableTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
        expandableTableView.expandableDelegate?.expandableTableView(expandableTableView, didSelectRowAt: indexPath)
    }
    
    @objc private func didSeleced(sender: NSNotification) {
        
        if (type == .one || type == .two || type == .three || type == .four || type == .five || type == .six || type == .seven || type == .eight || type == .nine || type == .ten || type == .eleven || type == .twelve || type == .other) {
            guard let subject = sender.object as? Subject else {return}
            if self.title != "Тесты".localized {
                let vc = BooksViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = TestSectionViewController()
                vc.id = subject.id
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return
        }
        
        switch self.type {
        case .news:
            let vc = NewsDetailViewController()
            vc.news = sender.object as? News
            self.navigationController?.pushViewController(vc, animated: true)
        case .favorite:
            let vc = ProblemViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    @objc private func reloadData() {
        self.tableView.reloadData()
    }
    
}
