

import Foundation
import UIKit
import SnapKit

class CustomTitleLabel: UILabel {
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        
        let label = self
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Global.asinastraFont(size: StaticSize.s28)
        label.textColor = Global.blackColor()
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
    }
}
