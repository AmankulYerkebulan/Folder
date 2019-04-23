import Foundation
import SwiftyJSON

class TestSectionModel {
    
    var id                : String?
    var name              : String?
    var number            : Int?
    var pass_rating       : Int?
    var challenge_section : Int?
    var allTest           : [TestSectionModel]?
    
    init(json: JSON) {
        self.allTest = json.arrayValue.map({ (subject) -> TestSectionModel in
            return TestSectionModel(objectJson: subject)
        })
    }
    
    init(objectJson: JSON) {
        self.id                = objectJson["id"].stringValue
        self.name              = objectJson["name"].stringValue
        self.number            = objectJson["number"].intValue
        self.pass_rating       = objectJson["pass_rating"].intValue
        self.challenge_section = objectJson["challenge_section"].intValue
    }
    
}
