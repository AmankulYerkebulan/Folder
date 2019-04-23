
import Foundation
import UIKit
import SnapKit

class LaunchView: UIView {
    
    //MARK: - Properties
    
    private let imageView = UIImageView(image: UIImage(named: "logo"))
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s40)
        label.textColor = Global.newsBorderColor()
        label.text = "FanToMath"
        return label
    }()
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        clipsToBounds = true
        
        setUpConstrains()
    }
}

extension LaunchView {
    
    //MARK: - Setup
    
    private func setUpConstrains() {
        
        self.logoBack()
        self.addSubview(imageView)
        self.addSubview(title)
        imageView.snp.makeConstraints { (imageView) in
            imageView.left.equalTo(self.snp.left).offset(StaticSize.s128 + 1)
            imageView.right.equalTo(self.snp.right).offset(-(StaticSize.s128 + 1))
            imageView.top.equalTo(self.snp.top).offset(StaticSize.s218)
            imageView.width.equalTo(StaticSize.s118)
            imageView.height.equalTo(StaticSize.s118)
        }
        
        title.snp.makeConstraints { (title) in
            
            title.top.equalTo(self.imageView.snp.bottom).offset(StaticSize.s30 + 1)
            title.centerX.equalTo(imageView.snp.centerX)
        }
        
    }
}

