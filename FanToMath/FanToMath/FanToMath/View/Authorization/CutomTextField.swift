

import Foundation
import UIKit
import SnapKit

class CutomTextField: UITextField {
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.commonInit()
    }
    
    private func commonInit() {
        
        let label = self
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Global.asinastraFont(size: StaticSize.s11)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.tintColor = Global.greyColor()
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 2
        label.layer.borderColor = Global.blueColor().cgColor
        label.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0.5, 0)
    }
}
