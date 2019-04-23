
import UIKit
import ExpandableCell

class DetailBooksViewController: UIViewController {
    
    //MARK: - Propertice
    
    fileprivate var delegateManager = DetailBooksManager()
    
    private var selectedIndex:Int?     = nil
    
    private lazy var expandableTableView: ExpandableTableView = {
        let tableView = ExpandableTableView()
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.register(CustomButtonCell.self, forCellReuseIdentifier: CustomButtonCell.cellIdentifier)
        tableView.register(BooksDetailCell.self, forCellReuseIdentifier: BooksDetailCell.cellIdentifier)
        tableView.register(BooksDetailCollectionViewCell.self, forCellReuseIdentifier: BooksDetailCollectionViewCell.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.animation = .automatic
        tableView.logoBack()
        return tableView
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        expandableTableView.expandableDelegate = self.delegateManager
        NotificationCenter.default.addObserver(self, selector: #selector(faqisSelected), name: .faqSelected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(problemSelect), name: .problemSelect, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .faqSelected, object: nil)
        NotificationCenter.default.removeObserver(self, name: .problemSelect, object: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension DetailBooksViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubview(expandableTableView)
        self.expandableTableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
    }
    
    //MARK: - Action
    
    @objc private func faqisSelected(sender: NSNotification) {
        guard let row = sender.object as? Int else {return}
        self.delegateManager.isSeleectedButton = self.selectedIndex == row
        self.selectedIndex = row
        let indexPath = IndexPath(row: row, section: 2)
        expandableTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
        expandableTableView.expandableDelegate?.expandableTableView(expandableTableView, didSelectRowAt: indexPath)
    }
    
    @objc private func problemSelect() {
        let vc = ProblemViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
