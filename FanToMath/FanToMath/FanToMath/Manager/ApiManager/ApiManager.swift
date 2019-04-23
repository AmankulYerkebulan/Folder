
import UIKit
import Alamofire
import SwiftyJSON

final class ApiManager {
    
    //MARK: - Shared Instance
    
    static let shared = ApiManager()
    
    private var manager: SessionManager!
    
    //MARK: - Init
    
    private init(){
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        
        self.manager = Alamofire.SessionManager (configuration: configuration)
    }
    
    //MARK: - GET
    
    func GET(path: String,
             parameters: Parameters?,
             onCompletion: @escaping (JSON, Error?) -> Void) {
        manager.request(path,
                        method: .get,
                        parameters: parameters == nil ? [:] : parameters,
                        encoding: URLEncoding.default,
                        headers: headers()).responseJSON { response in
                            
//                            if let ALLheader = response.response?.allHeaderFields  {
//
//                                if let header = ALLheader as? [String : Any] {
//
//                                    if let _ = header["x-pagination-total-count"] as? String {}
//                                }
//                            }
                            
                            switch (response.result) {
                            case .success:
                                
                                if let jsonData = response.result.value {
                                    let json = JSON(jsonData)
                                    onCompletion(json, nil)
                                } else {
                                    onCompletion(JSON.null, nil)
                                    
                                }
                                break
                            case .failure(let error):
                                if error._code == NSURLErrorTimedOut {
                                    onCompletion(JSON.null, error)
                                } else {
                                    print("error:\(error)")
                                }
                            }
        }
    }
    
    //MARK: - POST
    
    func POST(path: String,
              parameters: Parameters?,
              onCompletion: @escaping (JSON, Error?) -> Void) {
        
        Alamofire.request(path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers()).responseJSON { response in
            
            switch (response.result) {
            case .success:
                if let jsonData = response.result.value {
                    let json = JSON(jsonData)
                    onCompletion(json, nil)
                } else {
                    onCompletion(JSON.null, nil)
                }
                break
            case .failure(let error):
                print("error:\(error)")
                if error._code == NSURLErrorTimedOut {
                    onCompletion(JSON.null, error)
                }
            }
        }
    }
    
    func DELETE(path: String,
                parameters: Parameters?,
                onCompletion: @escaping (JSON, Error?) -> Void) {
        
        Alamofire.request(path, method: .delete,parameters: parameters)
            .responseJSON { response in
                
                switch (response.result) {
                case .success:
                    
                    if let jsonData = response.result.value {
                        let json = JSON(jsonData)
                        onCompletion(json, nil)
                    } else {
                        onCompletion(JSON.null, nil)
                    }
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                    }
                }
        }
    }
    
    private func headers() -> [String : String]? {
        
//        let user = StoreManager.shared().getUser()
//
//        if let _user = user,
//            let _userToken = _user.token {
//
//            let myHeader = ["Authorization": "Bearer \(_userToken)"]
//            //            let myHeader = ["Authorization": "Bearer 2697c3ff3d3017f184244232801b2d04"]
//            return myHeader
//        }
        
        return ["Authorization": "Token 4dc1084f48a098ef29ae0463154e4a66560640570c5058cff41f075852853e13"]
    }
}
