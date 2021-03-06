//
//  Home.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = UserViewModel()
    @Environment(\.managedObjectContext) var context
    @State var user: User
    
    var body: some View {
        VStack {
            Text("Hello, \(user.name)!")
            Text("Your mail : \(user.email)")
            
            Button(action: {
                viewModel.logoutUser(context: context, user: user)
            }, label: {
                Text("Logout")
                    .padding()
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
