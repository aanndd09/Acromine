//
//  ServiceHelper.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import Foundation
import Alamofire


enum ServiceHelper: URLRequestConvertible {
    case getAcromines(parameters: Parameters)
    
    static let baseURLString = "http://www.nactem.ac.uk/software/acromine"

    var method: HTTPMethod {
        switch self {
        case .getAcromines:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAcromines:
            return "/dictionary.py"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ServiceHelper.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .getAcromines(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}

extension Decodable {
    static func decode(JSONData:Data) -> Self? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Self.self, from: JSONData)
        } catch let error {
            print(error)
            return nil
        }
    }
}
