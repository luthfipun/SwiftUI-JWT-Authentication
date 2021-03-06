//
//  RemoteServices.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import Foundation
import Combine

class RemoteService: UserViewModel {
    
    let baseUrl = "http://192.168.200.100:8000/"
    
    func request(params: String) -> URLRequest {
        let url = URL(string: baseUrl + params)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func post(params: String, registerUseCase: RegisterUseCase) {
        
        isLoading.toggle()
        
        guard let jsonData = try? JSONEncoder().encode(registerUseCase) else {
            print("Can't encode data")
            return
        }
        
        let requestData = request(params: params)
        let post = URLSession.shared.uploadTask(with: requestData, from: jsonData) { data, response, error in
            
            if (error != nil) {
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let responseData = try? JSONDecoder().decode(UserModel.self, from: data!) else {
                print("Can't decode data")
                return
            }
            self.responseRegister(userModels: responseData)
        }
        post.resume()
    }
}
