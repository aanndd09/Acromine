//
//  AcromineViewModel.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import Foundation

protocol AcromineViewModelEvents: class {
    func fetchAcromineData(param:[String:Any], completion: @escaping (Acromine?, Error?) -> Void)
}

class AcromineViewModel: AcromineViewModelEvents {
    var delegate : AcromineViewModelEvents?
    var acromine: Acromine?
    
    init(acromine: Acromine? = nil) {
        self.acromine = acromine
    }
    
    init(delegate: AcromineViewModelEvents) {
        self.delegate = delegate
    }
    
    func fetchAcromineData(param:[String:Any],completion: @escaping (Acromine?, Error?) -> Void) {
        ServiceManager.getAcromines(param: param) { (response) in
            self.acromine = Acromine.decode(JSONData:response as! Data)!
            completion(self.acromine, nil)
        } failure: { (error) in
            completion(nil, error)
        }
    }
    
}
