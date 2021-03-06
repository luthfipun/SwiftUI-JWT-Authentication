//
//  Database.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 06/03/21.
//

import Foundation
import CoreData

struct Database {
    func insertUser(context: NSManagedObjectContext, userModel: UserModel) {
        
        let userData = userModel.data[0]
        
        let newUser = User(context: context)
        newUser.id = Int64(userData.id)
        newUser.name = userData.name
        newUser.email = userData.email
        newUser.token = userData.token
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteUser(context: NSManagedObjectContext, user: User) {
        do {
            context.delete(user)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
