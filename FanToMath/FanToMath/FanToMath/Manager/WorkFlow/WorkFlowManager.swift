
import Foundation
import SwiftyJSON
import UIKit

class WorkFlowManager: NSObject {
    
    //MARK: - Variables
    
    //TODO
    var isProfileSaved = false
    
    //MARK : - Shared Instance
    
    class func shared() -> WorkFlowManager {
        
        return sharedManager
    }
    
    private static var sharedManager: WorkFlowManager = {
        
        let manager = WorkFlowManager()
        return manager
    }()
    
    //MARK: - Init
    
    private override init() { super.init() }
    
    //MARK: - Helper
    
    //MARK: - POST Requests
    
    func useBonus(onCompletion: @escaping (Bool,String,String,String) -> Void) {
        
        let path = Global.pathFor(key: "useBonus")
        
        var params = [String : String]()
        
        ApiManager.shared.POST(path: path, parameters: params) { (json, error) in
            
            print("json:\(json)")
            
            if json["success"].boolValue == true {
                
            } else {
                onCompletion(false,"","","")
            }
        }
    }
    
    func registration() {
        
    }
    
    //MARK: - GET Requests
    
    func allTestsSection(id: String,onCompletion: @escaping ([TestSectionModel]?) -> Void) {
        
        let path = Global.pathFor(key: "testSection") + id
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            
            print("JSON:\(json)")
            
            let subject = TestSectionModel(json: json)
            onCompletion(subject.allTest)
        }
    }
    
    func allTests(level: String,onCompletion: @escaping ([Subject]?) -> Void) {
        
        let path = Global.pathFor(key: "test") + level + "/rus"
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            
            print("JSON:\(json)")
            
            let subject = Subject(json: json)
            onCompletion(subject.allsubject)
        }
    }
    
    func allSubjects(level: String,onCompletion: @escaping ([Subject]?) -> Void) {
        
        let path = Global.pathFor(key: "subjects") + level + "/rus"
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            
            print("JSON:\(json)")
            
            let subject = Subject(json: json)
            onCompletion(subject.allsubject)
        }
    }
    
    func allNews(onCompletion: @escaping ([News]?) -> Void) {
        
        let path = Global.pathFor(key: "news")
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            
            print("JSON:\(json)")
            
            let news = News(json: json)
            onCompletion(news.allNews)
        }
    }
    
    func textPages(onCompletion: @escaping (Bool) -> Void) {
        
        let path = Global.pathFor(key: "textPages")
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            
            print(json)
            
            if json["success"].boolValue == true {
                
                onCompletion(true)
            } else {
                onCompletion(false)
            }
        }
    }
}
