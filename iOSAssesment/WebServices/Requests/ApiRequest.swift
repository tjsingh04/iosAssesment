//
//  File.swift
//  iOSAssesment
//
//  Created by Zimble on 01/05/24.
//

import Foundation
class ApiRequest: NetworkRequest {
    var post = "posts"
    func fetchData(param: [String:Any] = [String:Any](), callback:@escaping ([UserDetail]?,NetworkError?)->()){
        
        self.getEncodedUrl(endPointUrl:post,params: param) { (response, error) in
            if error != nil{
                callback(nil,error)
            }else{
                var detail = [UserDetail]()
                if let data = response?.data as? Array<Dictionary<String, Any>>{
                    detail = data.map({return UserDetail($0)})
                }
                callback(detail, nil)
            }
            
        }
    }
}
