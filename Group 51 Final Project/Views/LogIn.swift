//
//  LogIn.swift
//  Group 51 Final Project
//
//  Created by  on 11/26/22.
//

import SwiftUI
import Firebase

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @State var isUserLoggedIn = false
    
    var body: some View{
        if isUserLoggedIn {
            ContentView()
        } else {
            content
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if(error != nil){
                print(error!.localizedDescription)
            }
        }
    }
    
    var content: some View{
        ZStack{
            VStack(spacing: 20){
                Text("Welcome")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                SecureField("Psasword", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                Button {
                    register()
                } label : {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        ).foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 110)
                
            }.frame(width: 350)
                .onAppear{
                    Auth.auth().addStateDidChangeListener{auth, user in
                        if(user != nil){
                            isUserLoggedIn.toggle()
                        }
                    }
                }
        }.ignoresSafeArea()    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if(error != nil){
                print(error!.localizedDescription)
            }
        }
    }
    
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        Login()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1: 0)
                self
            }
    }
}
