//
//  ContentView.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var user: FetchedResults<User>
    
    var body: some View {
        if user.count > 0 {
            Home(user: user[0])
        }else {
            Auth()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
