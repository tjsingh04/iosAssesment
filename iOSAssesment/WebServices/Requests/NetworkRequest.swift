//
//  NetworkRequest.swift

//

import Foundation
import Alamofire
class NetworkRequest{
    var accessToken: String = "" ;
    
    var baseUrl = "https://jsonplaceholder.typicode.com/"
    
//    func get(endPointUrl: String, params: [String: Any]? = [:], callback:  @escaping (NetworkResponse?, NetworkError?) ->()){
//        makeRequest(method: .get, endPoint: endPointUrl, params: params, callback: callback)
//    }
    func getEncodedUrl(endPointUrl: String, params: [String: Any]? = [:], callback:  @escaping (NetworkResponse?, NetworkError?) ->()){
        makeRequestURLENcoded(method: .get, endPoint: endPointUrl, params: params, callback: callback)
    }
    
    
    
    
    func cancelAllRequests(){
        AF.session.getTasksWithCompletionHandler({ dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        })
    }
    func makeRequestURLENcoded(method: HTTPMethod, endPoint: String, params: [String: Any]? = [:], callback: @escaping (NetworkResponse?, NetworkError?) ->()) {
        
        var headers: HTTPHeaders = [:]
        if (!self.accessToken.isEmpty){
            headers["Authorization"] = accessToken
        }
        AF.request(baseUrl + endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! , method: method, parameters: params, encoding: URLEncoding.default, headers:  headers ).responseData { response in
            switch response.result {
            case .success( _):
                //success, do anything
                if let networkResponse = NetworkResponse(response: response){
                    if (!networkResponse.isSuccessful()){
                        if networkResponse.getError().message != "cancelled"{
                            callback(nil, networkResponse.getError())
                        }
                        
                    }else{
                        callback(networkResponse, nil)
                    }
                }
                break
            case .failure(let error):
                let networkError = NetworkError(error: error)
                
                print(networkError.code)
                if networkError.code == 4{
                    callback(nil, NetworkError(error: "Invalid Respinse"))
                }else{
                    if networkError.code != 13{
                        callback(nil, networkError)
                    }
                }
                break
            }
        }
    }
    
    
}
