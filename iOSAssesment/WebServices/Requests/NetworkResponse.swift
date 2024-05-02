//
//  NetworkResponse.swift

//

import Foundation
import Alamofire

class NetworkResponse {
    
    var rawResponse: DataResponse<Data,AFError>
    var data: AnyObject?
    var dataCollection: NSArray?
    var error: String?
    var statusCode: Int?
    var success:Bool = false
    var payFOrSave:Bool!
    
    init?(response: DataResponse<Data, AFError>){
        
        self.rawResponse = response
        if self.rawResponse.response != nil{
            self.statusCode = self.rawResponse.response!.statusCode
        }
        self.success = self.statusCode == 200
        switch response.result {
        case .success(let value):
            if let result = value.dataToJSON()  {
                self.data = result as AnyObject?
            } else {
                    self.error = "Something went wrong"
            }
            break
        case.failure(let error):
            self.error = error.localizedDescription
            break
        
        }
        
    }
    
    func isSuccessful()->Bool {
        return self.success
    }
    
    func getError()->NetworkError {
        return NetworkError(error: self.error ?? "Something went wrong")
    }
    
}
extension Data {
   
    func dataToJSON() -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }
}
