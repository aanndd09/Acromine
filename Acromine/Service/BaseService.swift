//
//  BaseService.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import Foundation
import Alamofire

class BaseService: NSObject {
    
    func apiRequest(url:URLRequestConvertible, success: @escaping (_ response: Any?)-> Void, failure: @escaping (_ error:Error?)-> Void) {
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                print("Validation Successful")
                debugPrint(data)
                success(data)
                
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
}
