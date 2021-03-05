//
//  Auth.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI

struct Auth: View {
    
    @State var isLogin: Bool = false
    
    var body: some View {
        if isLogin {
            Login(isLogin: $isLogin)
        }else {
            Register(isLogin: $isLogin)
        }
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
