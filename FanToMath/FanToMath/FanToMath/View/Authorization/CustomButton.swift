

import Foundation
import UIKit

class CustomButton: UIButton {
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Global.blueColor()
        self.commonInit()
    }
    
    private func commonInit() {
        
        self.layer.cornerRadius = 4
        self.setTitleColor(Global.whiteColor(), for: .normal)
        self.titleLabel?.font = UIFont(name: "asinastra", size: StaticSize.s17)
    }
}
