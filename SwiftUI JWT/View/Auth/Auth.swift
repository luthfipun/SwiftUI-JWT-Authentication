//
//  Auth.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI

struct Auth: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State var isLogin: Bool = false
    
    var body: some View {
        if isLogin {
            Login(isLogin: $isLogin, viewModel: viewModel)
        }else {
            Register(isLogin: $isLogin, viewModel: viewModel)
        }
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
