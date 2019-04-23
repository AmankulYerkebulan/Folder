
import UIKit

class TestSectionViewController: UIViewController {

    //MARK: - Propertice
    
    var id: String?
    fileprivate var delegateManager = TestSectionManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.cellIdentifier)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSelect), name: .testSection, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .testSection, object: nil)
    }

}

extension TestSectionViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        guard let _id = id else { return }
        WorkFlowManager.shared().allTestsSection(id: _id) { (array) in
            self.delegateManager.testSection = array
            self.tableView.reloadData()
        }
        
    }
    
    @objc private func didSelect(sender: NSNotification) {
        
        if let _ = sender.object as? TestSectionModel {
        
            let vc = TestViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
