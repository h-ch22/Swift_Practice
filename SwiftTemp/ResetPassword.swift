//
//  ResetPassword.swift
//  SwiftTemp
//
//  Created by 하창진 on 2020/06/02.
//  Copyright © 2020 하창진. All rights reserved.
//

import SwiftUI

struct ResetPassword: View {
    @State private var email = ""

    var body: some View {
        VStack {
            Text("도움이 필요하신가요?")
            .font(.system(size : 30, design : .default))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding([.vertical], 70)
                .navigationBarTitle("비밀번호 재설정", displayMode: .inline)
            
            Text("로그인에 문제가 있나요?\n아래 필드에 가입하실 때 입력한 E-Mail 주소를\n입력하시면 비밀번호 재설정 링크를 발송해드립니다.")
                .multilineTextAlignment(.center)
            
            TextField("E-Mail", text: self.$email)
                .padding([.horizontal], 50)
                .padding([.vertical], 15)
                .keyboardType(.emailAddress)
            
            Button(action: self.reset) {
                HStack{
                    Text("비밀번호 재설정 링크 발송하기")
                    Image(systemName: "arrow.right")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                
                .cornerRadius(25)
            }
        }
    }
    
    func reset(){
        
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
