
import Foundation
import UIKit
import ExpandableCell

class BooksDetailCollectionViewCell: ExpandableCell {
    
    //MARK: - Variables
    
    static var cellIdentifier = "BooksDetailCollectionViewCell"
    
    fileprivate let delegateManager = DetailBookCollectionManager()
    
    let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
        flowLayout.itemSize = CGSize(width: StaticSize.s60, height: StaticSize.s60)
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.dataSource = self.delegateManager
        view.delegate = self.delegateManager
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.register(SectionNumberCollectionCell.self, forCellWithReuseIdentifier: SectionNumberCollectionCell.cellIdentifire)
        return view
    }()
    
    override func isSelectable() -> Bool {
        return true
    }
    
    override func isInitiallyExpanded() -> Bool {
        return false
    }
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
}

//MARK: - Setup

extension BooksDetailCollectionViewCell {
    
    //MARK: - Setup
    
    func setUpHeight(height: CGFloat) {
        self.collectionView.snp.makeConstraints { (mainView) in
            mainView.height.equalTo(height)
        }
        self.flowLayout.invalidateLayout()
    }
    
    private func setUp() {
        
        self.arrowImageView.isHidden = true
        self.backgroundColor = .clear
        self.addSubview(collectionView)
        self.selectionStyle = .none
        
        self.collectionView.snp.makeConstraints { (mainView) in
            mainView.top.equalTo(self.snp.top)
            mainView.left.equalTo(self.snp.left)
            mainView.right.equalTo(self.snp.right).offset(-16)
            mainView.bottom.equalTo(self.snp.bottom)
        }
    }
}


