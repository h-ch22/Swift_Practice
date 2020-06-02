//
//  Tutorial_Register.swift
//  SwiftTemp
//
//  Created by 하창진 on 2020/06/02.
//  Copyright © 2020 하창진. All rights reserved.
//

import SwiftUI


struct Tutorial_Register: View {
    @State private var email = ""
    @State private var password = ""
    @State private var nickname = ""
    @State private var phone = ""
    @State private var birth = Date()
    var gender = ["남성", "여성"]
    @State private var selected_gender = 0
    
    var body: some View {
                VStack {
                    Text("당신에 대해 더 깊게 알아보고 싶어요.")
                        .font(.system(size : 20, design : .default))
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
                            
                            
                    TextField("닉네임", text:self.$nickname)
                        .padding([.horizontal], 50)
                        .padding([.vertical], 15)
                            
                    TextField("전화번호", text:self.$phone)
                        .padding([.horizontal], 50)
                        .padding([.vertical], 15)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    
                    Form{
                        Section{
                            Picker(selection: $selected_gender, label : Text("성별")){
                                ForEach(0 ..< gender.count){
                                    Text(self.gender[$0])
                                }
                            }
                            
                            DatePicker("생년월일", selection:$birth, in: Date()..., displayedComponents: .date)

                        }
                    }
                    
                    Button(action: {}) {
                    Text("가입하기")
                        .foregroundColor(Color.orange)
                }
            }
        }
    
struct Tutorial_Register_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial_Register()
        }
    }
}
