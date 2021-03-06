//
//  UserViewModel.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import Foundation
import Combine
import CoreData

class UserViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String = ""
    @Published var isError: Bool = false
    
    var cancellableToken: AnyCancellable?
}

extension UserViewModel {
    
    func saveUser(context: NSManagedObjectContext, userModel: UserModel) {
        Database().insertUser(context: context, userModel: userModel)
    }
    
    func deleteUser(context: NSManagedObjectContext, user: User) {
        Database().deleteUser(context: context, user: user)
    }
    
    func registerUser(context: NSManagedObjectContext, name: String, email: String, password: String) {
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
                self.saveUser(context: context, userModel: response)
            })
    }
    
    func loginUser(context: NSManagedObjectContext, email: String, password: String) {
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
                self.saveUser(context: context, userModel: response)
            })
    }
    
    func logoutUser(context: NSManagedObjectContext, user: User) {
        cancellableToken = RemoteService.logout(token: user.token)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: {_ in}, receiveValue: { response in
                if response.code == 200 {
                    self.deleteUser(context: context, user: user)
                }
            })
    }
}
