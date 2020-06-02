//
//  signIn.swift
//  SwiftTemp
//
//  Created by 하창진 on 2020/06/02.
//  Copyright © 2020 하창진. All rights reserved.
//

import SwiftUI
import Firebase

struct signIn: View {
    @State private var email = ""
    @State private var password = ""
    @State var isModal : Bool = false

    var body: some View {
        NavigationView{
            VStack {
                Text("환영합니다!")
                .font(.system(size : 35, design : .default))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding([.vertical], 70)
                .navigationBarTitle("회원가입", displayMode: .inline)
                
                TextField("E-Mail", text: self.$email)
                    .padding([.horizontal], 50)
                    .padding([.vertical], 15)
                    .keyboardType(.emailAddress)
                        
                SecureField("비밀번호", text : self.$password)
                    .padding([.horizontal], 50)
                    .padding([.vertical], 15)
                
                HStack {
                    NavigationLink(destination: ResetPassword()){
                        Text("로그인에 문제가 있나요?")
                    }.buttonStyle(PlainButtonStyle())
                    
                    Button(action: self.signIn) {
                        HStack{
                            Text("로그인하기")
                            Image(systemName: "arrow.right")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        
                        .cornerRadius(25)
                        .padding(.horizontal, 1)
                    }
                }
                
                Button("회원가입"){
                    self.isModal = true
                }.sheet(isPresented: $isModal, content : {
                    Tutorial_Register()
                })
            }
        }
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: self.email, password: self.password){(user, error) in
            if user != nil{
                print("sign-in success")
                print(user)
                }
            
            else{
                print(error)
            }
        }
    }
}

struct signIn_Previews: PreviewProvider {
    static var previews: some View {
        signIn()
    }
}
