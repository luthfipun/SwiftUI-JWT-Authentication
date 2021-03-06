//
//  ContentView.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        Auth()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
