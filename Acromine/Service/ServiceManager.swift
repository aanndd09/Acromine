//
//  ServiceManager.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import Foundation

class ServiceManager: NSObject {
    
    static func getAcromines(param:[String:Any], success: @escaping (_ response: Any?) -> Void,
                            failure: @escaping (_ error: Error?) -> Void) {
        BaseService().apiRequest(url: ServiceHelper.getAcromines(parameters: param), success: { (response) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
}
