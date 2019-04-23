
import Foundation
import UIKit

class Global {
    
    //MARK: - Path For Links
    
    class func pathFor(key: String) -> String
    {
        if let path = Bundle.main.path(forResource: "api", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            let path = dict[key] as! String
            let domen = dict["domen"] as! String
            let link = "\(domen)\(path)"
            return link
        }
        else { return "" }
    }
    
    //MARK: - Safe area
    
    class func safeAreaTop() -> CGFloat
    {
        if #available(iOS 11.0, *)
        {
            var area = (UIApplication.shared.keyWindow?.safeAreaInsets.top)!
            if  area == 0 { area = 20 }
            return area
        } else {
            return 0
        }
    }
    
    class func safeAreaBottom() -> CGFloat
    {
        if #available(iOS 11.0, *)
        {
            var area = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
            if area == 0 { area = 20 }
            return area
        } else {
            return 20
        }
    }
    
    class func blueColor() -> UIColor {
        return #colorLiteral(red: 0.05098039216, green: 0.4666666667, blue: 0.7333333333, alpha: 1)
    }
    
    class func whiteColor() -> UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    class func blackColor() -> UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    class func greyColor() -> UIColor {
        return #colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 1)
    }
    
    class func greyLineColor() -> UIColor {
        return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
    
    class func sideBlueColor() -> UIColor {
        return #colorLiteral(red: 0.02745098039, green: 0.2196078431, blue: 0.3450980392, alpha: 0.1525042808)
    }
    
    class func newsCellColor() -> UIColor {
        return #colorLiteral(red: 0.07843137255, green: 0.5607843137, blue: 0.8705882353, alpha: 1)
    }
    
    class func newsBorderColor() -> UIColor {
        return #colorLiteral(red: 0.05098039216, green: 0.4666666667, blue: 0.7333333333, alpha: 1)
    }
    
    class func statusColor() -> UIColor {
        return #colorLiteral(red: 0.02745098039, green: 0.2274509804, blue: 0.3450980392, alpha: 1)
    }
    
    class func faqLblColor() -> UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    class func asinastraFont(size: CGFloat) -> UIFont? {
        return UIFont(name: "asinastra", size: size)
    }
    
    class func comicSansFont(size: CGFloat) -> UIFont? {
        return UIFont(name: "ComicSansMS", size: size)
    }
    
    class func heightOfSection(typeAuth: AuthorizationType,section: Int,arraySection: [AuthorizationSectionViewType]) -> CGFloat {
        if typeAuth == .newPassword {
            if arraySection[section] == .title {
                
                return StaticSize.s128
            }
            if arraySection[section] == .textFiled {
                
                return StaticSize.s140
            }
            if arraySection[section] == .button {
                
                return StaticSize.s30
            }
        } else if typeAuth == .forgotPassword {
            if arraySection[section] == .title {
                
                return StaticSize.s188
            }
            if arraySection[section] == .textFiled {
                
                return StaticSize.s90
            }
            if arraySection[section] == .button {
                
                return StaticSize.s30
            }
        } else if typeAuth == .code {
            if arraySection[section] == .title && section == 0 {
                
                return StaticSize.s90 + 7
            }
            if arraySection[section] == .title && section == 1 {
                
                return StaticSize.s46 + 3
            }
            if arraySection[section] == .textFiled {
                
                return StaticSize.s36 + 2
            }
            if arraySection[section] == .button {
                
                return StaticSize.s30
            }
        } else if typeAuth == .language {
            if arraySection[section] == .title {
                
                return StaticSize.s90 + 7
            }
            if arraySection[section] == .button {
                
                return StaticSize.s128
            }
        } else if typeAuth == .signUp {
            if arraySection[section] == .title && section == 0 {
                
                return StaticSize.s44
            }
            if arraySection[section] == .title && section == 1 {
                
                return StaticSize.s115
            }
            if arraySection[section] == .textFiled {
                
                return StaticSize.s138
            }
            if arraySection[section] == .button {
                
                return StaticSize.s42
            }
        }
        
        return 0
    }
    
    static let titleDictionary:[SideCellType:String] = [.one:"1 класс",.two:"2 класс",.three:"3 класс",.four:"4 класс",.five:"5 класс",.six:"6 класс",.seven:"7 класс",.eight:"8 класс",.nine:"9 класс",.ten:"10 класс",.eleven:"11 класс",.twelve:"12 класс",.other:"Другие",.favorite:"Избранное",.news:"Новости",.setting:"Настройки",.faq:"FAQ",.about:"О проекте",.logout:"Выйти"]
    
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct StaticSize {
    static let s14 = ScreenSize.SCREEN_WIDTH / 26.7
    static let s30 = ScreenSize.SCREEN_WIDTH / 12.5
    static let s44 = ScreenSize.SCREEN_WIDTH / 8.5
    static let s18 = ScreenSize.SCREEN_WIDTH / 20.8
    static let s20 = ScreenSize.SCREEN_WIDTH / 18.75
    static let s16 = ScreenSize.SCREEN_WIDTH / 23.4
    static let s12 = ScreenSize.SCREEN_WIDTH / 31.25
    static let s19 = ScreenSize.SCREEN_WIDTH / 19.7
    static let s60 = ScreenSize.SCREEN_WIDTH / 6.25
    static let s76 = ScreenSize.SCREEN_WIDTH / 4.93
    static let s9  = ScreenSize.SCREEN_WIDTH / 41.6
    static let s260 = ScreenSize.SCREEN_WIDTH / 1.44
    static let s150 = ScreenSize.SCREEN_WIDTH / 2.5
    static let s22 = ScreenSize.SCREEN_WIDTH / 17
    static let s17 = ScreenSize.SCREEN_WIDTH / 22
    static let s100 = ScreenSize.SCREEN_WIDTH / 3.75
    static let s28 = ScreenSize.SCREEN_WIDTH / 13.39
    static let s118 = ScreenSize.SCREEN_WIDTH / 3.23 + 2
    static let s23 = ScreenSize.SCREEN_WIDTH / 16.3
    static let s36 = ScreenSize.SCREEN_WIDTH / 10.4
    static let s34 = ScreenSize.SCREEN_WIDTH / 11
    static let s40 = ScreenSize.SCREEN_WIDTH / 9.375
    static let s10 = ScreenSize.SCREEN_WIDTH / 37.5
    static let s240 = ScreenSize.SCREEN_WIDTH / 1.56
    static let s135 = ScreenSize.SCREEN_WIDTH / 2.7
    static let s184 = ScreenSize.SCREEN_WIDTH / 2
    static let s316 = ScreenSize.SCREEN_WIDTH / 1.18
    static let s75 = ScreenSize.SCREEN_WIDTH / 5
    static let s50 = ScreenSize.SCREEN_WIDTH / 7.5
    static let s86 = ScreenSize.SCREEN_WIDTH / 4.36
    static let s15 = ScreenSize.SCREEN_WIDTH / 25
    static let s42 = ScreenSize.SCREEN_WIDTH / 8.92
    static let s11 = ScreenSize.SCREEN_WIDTH / 34
    static let s57 = ScreenSize.SCREEN_WIDTH / 6.81 + 2
    static let s46 = ScreenSize.SCREEN_WIDTH / 8.15
    static let s70 = ScreenSize.SCREEN_WIDTH / 5.357
    static let s55 = ScreenSize.SCREEN_WIDTH / 6.81
    static let s128 = ScreenSize.SCREEN_WIDTH / 2.92
    static let s140 = ScreenSize.SCREEN_WIDTH / 2.67
    static let s188 = ScreenSize.SCREEN_WIDTH / 1.99
    static let s90 = ScreenSize.SCREEN_WIDTH / 4.16
    static let s80 = ScreenSize.SCREEN_WIDTH / 4.68
    static let s26 = ScreenSize.SCREEN_WIDTH / 14.42
    static let s138 = ScreenSize.SCREEN_WIDTH / 2.71
    static let s115 = ScreenSize.SCREEN_WIDTH / 3.26
    static let s8 = ScreenSize.SCREEN_WIDTH / 46.875
    static let s105 = ScreenSize.SCREEN_WIDTH / 3.57
    static let s25 = ScreenSize.SCREEN_WIDTH / 15
    static let s227 = ScreenSize.SCREEN_WIDTH / 1.65
    static let s160 = ScreenSize.SCREEN_WIDTH / 2.34
    static let s194 = ScreenSize.SCREEN_WIDTH / 1.93
    static let s276 = ScreenSize.SCREEN_WIDTH / 1.35
    static let s121 = ScreenSize.SCREEN_WIDTH / 3.1
    static let s218 = ScreenSize.SCREEN_WIDTH / 1.72
}

