//
//  Register.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI
import AlertToast

struct Register: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isLoading: Bool = false
    @Binding var isLogin: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            HStack {
                Image(systemName: "person.fill")
                TextField("Name", text: $name)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
            
            HStack {
                Image(systemName: "envelope.fill")
                TextField("Email", text: $email)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
            
            HStack {
                Image(systemName: "lock.shield.fill")
                SecureField("Password", text: $password)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
            
            Spacer()
            
            Button(action: {
                isLoading.toggle()
            }, label: {
                Text("Register Now")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isLoading ? Color.blue.opacity(0.2) : Color.blue)
                    .clipShape(Capsule())
                    .disabled(true)
                    .overlay(
                        isLoading ? ProgressView() : nil
                    )
            })
            
            Button(action: {
                isLogin.toggle()
            }, label: {
                Text("Login Here")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }).padding(.top, 5)
            
        }.padding()
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
