//
//  Api.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import Foundation
import Combine

struct ApiService {
    static let baseURL = URL(string: "http://192.168.200.100:8000/")
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

extension ApiService {
    
    static func request(_ path: ApiPath, method: RequestMethod, token: String = "", formData: Data = Data()) -> URLRequest {
        guard let components = URLComponents(url: baseURL!.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true) else {
            fatalError("Can't open the url")
        }
        
        var request =  URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !token.isEmpty {
            request.setValue("Bearer + \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch method {
        case .post, .put:
            request.httpBody = formData
        default:
            break
        }
        
        return request
    }
}
