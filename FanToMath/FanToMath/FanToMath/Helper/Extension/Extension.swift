

import Foundation
import UIKit

extension Notification.Name {
    static let labelPressed      = Notification.Name("FORGORPASSWORD")
    static let segmentPressed    = Notification.Name("SEGMENTPRESSED")
    static let faqSelected       = Notification.Name("FAQSELECTED")
    static let cellIsSelected    = Notification.Name("CEELLISSELECTEC")
    static let notFound          = Notification.Name("NOTFOUND")
    static let savePressedBook   = Notification.Name("SAAVEPRESSEDBOOK")
    static let bookPressed       = Notification.Name("BOOKPRESSED")
    static let problemSelect     = Notification.Name("problemselect")
    static let savePressed       = Notification.Name("SAVEPRESSED")
    static let reloadData        = Notification.Name("REELOADDATA")
    static let testSection       = Notification.Name("TESTSECTION")
}

extension UIViewController {
    
    func setupRevealVC() {
        
        if self.revealViewController() != nil {
            
            view.addGestureRecognizer(revealViewController()!.tapGestureRecognizer())
            view.addGestureRecognizer(revealViewController()!.panGestureRecognizer())
            navigationItem.leftBarButtonItem = UIBarButtonItem (image: UIImage(named: "menu")!.withRenderingMode(.alwaysOriginal),
                                                                landscapeImagePhone: nil,
                                                                style: .plain,
                                                                target: revealViewController(),
                                                                action: #selector(revealViewController().revealToggle(_:)))
        }
    }
}

extension UIView {
    
    func addSubViews(views: [UIView]) {
        for i in views {
            self.addSubview(i)
        }
    }
}

extension UILabel {
    
    func fontLabel(color: UIColor,fontName:String,size:CGFloat) {
        self.font = UIFont(name: fontName, size: size)
        self.textColor = color
    }
}

extension String {
    
    var localized: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
    
}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y:(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x:locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y:locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}

extension UINavigationController {
    
    func setupNavigatioBar() {
        
        UINavigationBar.appearance().barTintColor = Global.blueColor()
        UINavigationBar.appearance().tintColor    = Global.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(nil, for: .normal, barMetrics: .default)        
        UINavigationBar.appearance().isTranslucent = false
    }
}

extension UIView {
    
    func clearBack() {
        self.backgroundColor = .clear
    }
    
    func logoBack() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
}

extension String {
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            fatalError()
        }
        dateFormatter.dateFormat = "MM.dd.yyyy"
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
}
