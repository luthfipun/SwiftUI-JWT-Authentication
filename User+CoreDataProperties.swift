//
//  User+CoreDataProperties.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 06/03/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var email: String
    @NSManaged public var token: String

}

extension User : Identifiable {

}
