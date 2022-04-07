//
//  AuthenticationView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/07.
//

import SwiftUI

struct AuthenticationView: View {
    @State var email = ""
    @State var certificationNumber = ""
    @State var isAuthenticated = false
    @State var isSendedEmail = false
    @State private var showSendSuccessModal = false
    @State private var showSendFailModal = false
    @State private var showSuccessAuthenticateModal = false
    @State private var showFailAuthenticateModal = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                Image("logo-img")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 100.0)
                
                TextField("가입한 이메일", text: $email)
                    .padding(.horizontal, 60.0)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                }, label: {
                    Text("인증번호 발송")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                        .cornerRadius(10)
                })
                .padding(.vertical)
                
                SecureField("인증번호 작성", text: $certificationNumber)
                    .padding(.horizontal, 60.0)
                    .textFieldStyle(.roundedBorder)
                
                
                
                if isSendedEmail == true {
                    Button(action: {
                        if certificationNumber == "12345" {
                            isAuthenticated = true
                        }
                        else {
                            isAuthenticated = false
                        }
                    }, label: {
                        Text("인증하기")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                            .cornerRadius(10)
                    })
                    .padding(.vertical)
                }
                else {
                    Text("인증하기")
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color(red: 0.771, green: 0.771, blue: 0.779))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                
//              인증 되었을때만 누를 수 있음.
                if isAuthenticated == true {
                    NavigationLink(destination: ResetPasswordView()) {
                        Text("비밀번호 초기화")
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
                else {
                    Text("비밀번호 초기화")
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color(red: 0.771, green: 0.771, blue: 0.779))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                 
                
            }
        }
        }
        
        
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
