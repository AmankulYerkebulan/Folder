import Foundation
import UIKit

class SectionNumberCollectionCell: UICollectionViewCell {
    
    //MARK: - Variable
    
    static let cellIdentifire = "SectionNumberCollectionCell"
    
    private lazy var sectionView: UIView = {
        let view = UIView()
        view.backgroundColor = Global.newsBorderColor()
        view.layer.cornerRadius = StaticSize.s8
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let view = UILabel()
        view.text = "N 428"
        view.font = Global.comicSansFont(size: StaticSize.s12 + 1)
        view.textColor = Global.whiteColor()
        return view
    }()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        setUpViews()
    }
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionNumberCollectionCell {
    
    private func setUpViews(){
        
        self.addSubViews(views: [sectionView])
        self.sectionView.addSubview(titleLbl)
        self.sectionView.snp.makeConstraints { (handImageView) in
            handImageView.top.equalTo(self.snp.top)
            handImageView.left.equalTo(self.snp.left)
            handImageView.right.equalTo(self.snp.right)
            handImageView.width.equalTo(StaticSize.s60)
            handImageView.height.equalTo(StaticSize.s60)
        }
        self.titleLbl.snp.makeConstraints { (handImageView) in
            handImageView.centerX.equalTo(self.sectionView.snp.centerX)
            handImageView.centerY.equalTo(self.sectionView.snp.centerY)
        }
    }
}
