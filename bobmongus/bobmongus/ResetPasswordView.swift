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
//            Text("이메일: \(email)")
            
            Button(action: {
            }, label: {
                Text("인증번호 발송")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                    .cornerRadius(10)
            })
            .padding(.vertical)
//            Image("bobmongusApp")
            
            
            
            SecureField("인증번호 작성", text: $certificationNumber)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
//            Text("인증번호 : \(certificationNumber)")
            Button(action: {
            }, label: {
                Text("인증하기")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                    .cornerRadius(10)
            })
            .padding(.vertical)
        }
        
        
        
    }
}


//struct UnionButtonStyle: ButtonStyle {
//
//    var backgroundColor: Color = Color(red: 112, green: 60, blue: 134)
//    var cornerRadius: CGFloat = 10
//
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .foregroundColor(.white)
//            .padding()
//            .background(
//                Color(red: 0.519, green: 0.24, blue: 0.527)
//            )
//            .foregroundColor(.white)
//
//
//    }
//
//}


struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
