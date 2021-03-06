//
//  UserViewModel.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var userModel: UserModel = UserModel()
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String = ""
    @Published var isError: Bool = false
    
    var cancellableToken: AnyCancellable?
}

extension UserViewModel {
    
    func registerUser(name: String, email: String, password: String) {
        self.isLoading.toggle()
        let formData = RegisterUseCase(name: name, email: email, password: password)
        cancellableToken = RemoteService.register(registerUseCase: formData)
            .mapError({ (error) -> Error in
                self.isLoading.toggle()
                print(error)
                return error
            })
            .sink(receiveCompletion: {_ in}, receiveValue: { response in
                self.isLoading.toggle()
                
                if response.code != 200 {
                    self.isError.toggle()
                    self.errorMessage = response.message
                    return
                }
                self.userModel = response
            })
    }
    
    func loginUser(email: String, password: String) {
        self.isLoading.toggle()
        let formData = LoginUseCase(email: email, password: password)
        cancellableToken = RemoteService.login(loginUseCase: formData)
            .mapError({ (error) -> Error in
                self.isLoading.toggle()
                print(error)
                return error
            })
            .sink(receiveCompletion: {_ in}, receiveValue: { response in
                self.isLoading.toggle()
                
                if response.code != 200 {
                    self.isError.toggle()
                    self.errorMessage = response.message
                    return
                }
                self.userModel = response
            })
    }
}
