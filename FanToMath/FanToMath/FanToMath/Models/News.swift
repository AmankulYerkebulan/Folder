
import Foundation
import SwiftyJSON

class News {
    
    var id          : String?
    var title       : String?
    var image       : URL?
    var description : String?
    var source      : URL?
    var slug        : String?
    var date        : String?
    var allNews     : [News]?
    
    init(json: JSON) {
        self.allNews = json.arrayValue.map({ (news) -> News in
            return News(objectJson: news)
        })
    }
    
    init(objectJson: JSON) {
        self.id          = objectJson["id"].stringValue
        self.title       = objectJson["title"].stringValue
        self.image       = objectJson["image"].url
        self.description = objectJson["text"].stringValue
        self.source      = objectJson["source"].url
        self.slug        = objectJson["slug"].stringValue
        self.date        = objectJson["pub_date"].stringValue
        self.date        = self.date?.dateFormatter()
    }
    
}
