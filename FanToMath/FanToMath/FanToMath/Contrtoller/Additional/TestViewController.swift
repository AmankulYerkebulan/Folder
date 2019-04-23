
import UIKit

class TestViewController: UIViewController {

    //MARK: - Propertice
    
    var type:Test = Test.screenTest
    
    fileprivate var delegateManager = TestManager()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTitleCell.self, forCellReuseIdentifier: CustomTitleCell.cellIdentifier)
        tableView.register(TestableCell.self, forCellReuseIdentifier: TestableCell.cellIdentifier)
        tableView.register(CustomButtonCell.self, forCellReuseIdentifier: CustomButtonCell.cellIdentifier)
        tableView.dataSource = self.delegateManager
        tableView.delegate = self.delegateManager
        tableView.separatorStyle = .none
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: StaticSize.s60))
        tableView.tableFooterView = view
        tableView.logoBack()
        return tableView
    }()
    
    private lazy var button: CustomButton = {
        let button = CustomButton()
        button.setTitle(self.type == .startTest ? "Проверить".localized : "Пройти заново".localized, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
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

extension TestViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubview(tableView)
        self.view.insertSubview(button, aboveSubview: tableView)
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view.snp.top)
            tableView.bottom.equalTo(self.view.snp.bottom)
            tableView.width.equalTo(self.view.snp.width)
        }
        
        self.button.snp.makeConstraints { (tableView) in
            tableView.bottom.equalTo(self.view.snp.bottom).offset(-StaticSize.s20)
            tableView.left.equalTo(self.view.snp.left).offset(StaticSize.s55)
            tableView.right.equalTo(self.view.snp.right).offset(-StaticSize.s55)
            tableView.height.equalTo(StaticSize.s46)
        }
        
        if type == .startTest {
            self.delegateManager.arraySection = [.startTime,.question]
        } else if type == .endTest {
            self.delegateManager.arraySection = [.timeEnd,.result,.question]
        } else {
            self.delegateManager.arraySection = [.description,.startTime,.button]
        }
        NotificationCenter.default.addObserver(self, selector: #selector(labelPressed), name: .labelPressed, object: nil)
        
    }
    
    //MARK: - Action
    
    @objc private func buttonPressed() {
        if type == .startTest {
            self.delegateManager.arraySection = [.timeEnd,.result,.question]
        } else if type == .endTest {
            self.delegateManager.arraySection = [.description,.startTime,.button]
            self.button.isHidden = true
        } else {
            self.delegateManager.arraySection = [.startTime,.question]
        }
        button.setTitle(self.type == .startTest ?  "Пройти заново".localized : "Проверить".localized , for: .normal)
        self.tableView.reloadData()
        self.type = self.type == .startTest ? .endTest : .startTest
    }
    
    @objc private func labelPressed() {
        self.type = .startTest
        if type == .startTest {
            self.delegateManager.arraySection = [.startTime,.question]
        } else {
            self.delegateManager.arraySection = [.timeEnd,.result,.question]
        }
        button.setTitle(self.type == .startTest ? "Проверить".localized : "Пройти заново".localized, for: .normal)
        self.tableView.reloadData()
        self.button.isHidden = false
    }
    
}
