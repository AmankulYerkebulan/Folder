
import UIKit

class BooksViewController: UIViewController {
    
    //MARK: - Propertice
    
    fileprivate let delegateManager = BooksManager()
    
    private lazy var searchBar: CustomSearchBar = {
        let view = CustomSearchBar()
        view.setUp()
        view.delegate = self.delegateManager
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
        layout.itemSize = CGSize(width: StaticSize.s100 + 2, height: StaticSize.s160 + StaticSize.s60 + StaticSize.s12)
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self.delegateManager
        view.delegate = self.delegateManager
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        layout.footerReferenceSize = CGSize(width: ScreenSize.SCREEN_WIDTH - 32, height: 60)
        view.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionFooter)
        view.register(BooksCollectionCell.self, forCellWithReuseIdentifier: BooksCollectionCell.cellIdentifire)
        view.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionFooterView.collectionViewHeaderFooterReuseIdentifier)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.logoBack()
        return view
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.alpha = 0
        return view
    }()
    
    private lazy var customAlert: CustomAlertAddBook = {
        let view = CustomAlertAddBook()
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
        NotificationCenter.default.addObserver(self, selector: #selector(notFoundPressed), name: .notFound, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(savePressedBook), name: .savePressedBook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(bookPressed), name: .bookPressed, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .notFound, object: nil)
        NotificationCenter.default.removeObserver(self, name: .savePressedBook, object: nil)
        NotificationCenter.default.removeObserver(self, name: .bookPressed, object: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension BooksViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()

        self.view.addSubview(mainView)
        self.mainView.addSubViews(views: [collectionView,searchBar])
        self.mainView.insertSubview(blurView, aboveSubview: blurView)
        blurView.addSubview(self.customAlert)
        searchBar.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.view.snp.top).offset(StaticSize.s20)
            collectionView.height.equalTo(StaticSize.s36)
            collectionView.left.equalTo(self.view.snp.left).offset(16)
            collectionView.right.equalTo(self.view.snp.right).offset(-16)
        }
        
        collectionView.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.searchBar.snp.bottom).offset(StaticSize.s12)
            collectionView.bottom.equalTo(self.view.snp.bottom)
            collectionView.left.equalTo(self.view.snp.left)
            collectionView.right.equalTo(self.view.snp.right).offset(-16)
        }
        
        customAlert.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.blurView.snp.top).offset(StaticSize.s194)
            collectionView.left.equalTo(self.blurView.snp.left).offset(StaticSize.s9)
            collectionView.right.equalTo(self.blurView.snp.right).offset(-StaticSize.s9)
        }
        
        mainView.snp.makeConstraints { (collectionView) in
            collectionView.top.equalTo(self.view.snp.top)
            collectionView.bottom.equalTo(self.view.snp.bottom)
            collectionView.left.equalTo(self.view.snp.left)
            collectionView.right.equalTo(self.view.snp.right)
        }
        
    }
    
    //MARK: - Action
    
    @objc private func notFoundPressed() {
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
    }
    
    @objc private func savePressedBook() {
        UIView.animate(withDuration: 0.2) {
            self.blurView.alpha = 0
        }
    }
    
    @objc private func bookPressed() {
        
        let vc = DetailBooksViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
