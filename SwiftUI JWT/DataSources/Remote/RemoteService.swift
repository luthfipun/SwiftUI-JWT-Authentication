//
//  RemoteService.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 06/03/21.
//

import Foundation
import Combine

struct RemoteService {
    static let apiClient = ApiClient()
}

enum ApiPath: String {
    case register = "register"
}

extension RemoteService {
    
    static func register(registerUseCase: RegisterUseCase) -> AnyPublisher<UserModel, Error> {
        let formData = try! JSONEncoder().encode(registerUseCase)
        let request = ApiService.request(.register, method: .post, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
