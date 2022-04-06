//
//  ResetPasswordView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State var email = ""
    @State var certificationNumber = ""
    
    var body: some View {
        VStack {
            TextField("가입한 이메일", text: $email)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            Text("이메일: \(email)")
            
            Button("인증번호 발송") {}
            .padding(.vertical)
            .buttonStyle(UnionButtonStyle())
//            Image("bobmongusApp")
            
            
            
            SecureField("가입한 이메일", text: $certificationNumber)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            Text("인증번호 : \(certificationNumber)")
            Button("인증") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(.vertical)
        }
        
        
        
    }
}


struct UnionButtonStyle: ButtonStyle {
    
    var backgroundColor: Color = Color(red: 112, green: 60, blue: 134)
    var cornerRadius: CGFloat = 10
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(
                Color(red: 0.519, green: 0.24, blue: 0.527)
            )
            .foregroundColor(.white)
            
            
    }
    
}


struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
