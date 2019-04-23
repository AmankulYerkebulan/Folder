import Foundation
import SwiftyJSON

class Subject {
    
    var id          : String?
    var name        : String?
    var level       : String?
    var language    : String?
    var allsubject  : [Subject]?
    
    init(json: JSON) {
        self.allsubject = json.arrayValue.map({ (subject) -> Subject in
            return Subject(objectJson: subject)
        })
    }
    
    init(objectJson: JSON) {
        self.id          = objectJson["id"].stringValue
        self.name        = objectJson["name"].stringValue
        self.level       = objectJson["level"].stringValue
        self.language    = objectJson["language"].stringValue
    }
    
}
