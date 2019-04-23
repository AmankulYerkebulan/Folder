
import Foundation

enum AuthorizationType {
    case signIn
    case signUp
    case forgotPassword
    case newPassword
    case code
    case language
    case limit
    case share
    case access
    case listTranzation
    case saveAndContinueProfile
    case saveAndContinuePurchase
    case startTest
}

enum CellType {
    case phone
    case password
    case title
    case icon
    case forgotPassword
    case button
    case signUp
    case newPassword
    case repeatPassword
    case centerTitle
    case code
}

enum AuthorizationSectionViewType {
    case textFiled
    case icon
    case button
    case forgotPassword
    case signUp
    case title
}

enum SideSection {
    case info
    case title
    case fillProfile
    case signIn
}

enum SideCellType:Int {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case other
    case favorite
    case news
    case setting
    case faq
    case about
    case logout
    case empty
    case info
    case fillProfile
    case signIn
}

enum Problem {
    case problem
    case decisionVideo
    case button
    case decisionText
    case error
}

enum SettingSection {
    case profileImage
    case info
    case check
    case location
    case button
    case changePasssword
    case title
    case listTitle
}

enum SettingCellType {
    case image
    case phone
    case name
    case lastname
    case firstCheck
    case secondCheck
    case save
    case oblast
    case city
    case school
    case levelclass
    case language
    case newPaassword
    case repatPassword
    case button
    case title
    case listTitle
    case tarif
    case purchaseType
}

enum SettingType {
    case setting
    case profile
    case purchase
}

enum TestSection {
    case timeEnd
    case result
    case question
    case startTime
    case description
    case button
}

enum Test {
    case startTest
    case endTest
    case screenTest
}
