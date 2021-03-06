//
//  Login.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import SwiftUI
import AlertToast

struct Login: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isLogin: Bool
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
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
                
                viewModel.loginUser(email: email, password: password)
                
            }, label: {
                Text("Login")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(viewModel.isLoading ? Color.blue.opacity(0.2) : Color.blue)
                    .clipShape(Capsule())
                    .disabled(true)
                    .overlay(
                        viewModel.isLoading ? ProgressView() : nil
                    )
            })
            .disabled(viewModel.isLoading)
            
            Button(action: {
                isLogin.toggle()
            }, label: {
                Text("Register Here")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }).padding(.top, 5)
            
        }.padding()
        .toast(isPresenting: $viewModel.isError, alert: {
            AlertToast(displayMode: .hud, type: .regular, subTitle: viewModel.errorMessage)
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
