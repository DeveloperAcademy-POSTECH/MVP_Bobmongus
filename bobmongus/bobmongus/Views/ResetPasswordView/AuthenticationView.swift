//
//  AuthenticationView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/07.
//

import SwiftUI

struct AuthenticationView: View {
    
//    @StateObject var dataManager = DataManager()
    @State private var email = ""
    @State private var certificationNumber = ""
    @State private var isAuthenticated = false
    @State private var isSendedEmail = false
    @State private var showSendSuccessModal = false
    @State private var showSendFailModal = false
    @State private var showSuccessAuthenticateModal = false
    @State private var showFailAuthenticateModal = false
    @StateObject var users = User()
//    @ObservedObject var users = User()
    
    var body: some View {
        
        NavigationView{
            VStack {
//                ForEach(users.users) {user in
//                    Text("\(user.email)")
//                    Text("\(user.password)")
//                }
                
//                ForEach(dataManager.jsonArray) { jsonValue in
//                                Text("Username is \(jsonValue.password)")
//                            }
                
                Image("logo-img")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 100.0)
                
                TextField("가입한 이메일", text: $email)
                    .autocapitalization(.none)
                    .padding(.horizontal, 60.0)
                    .textFieldStyle(.roundedBorder)
                //              인증번호 발송 로직
                Button(action: {
                    
                    for user in users.users {
                        let userEmail = user.email
                        if userEmail == email {
                            isSendedEmail = true
                            showSendSuccessModal = true
                            break
                        }
                    }
                    if isSendedEmail == false {
                        showSendFailModal = true
                    }
                }, label: {
                    Text("인증번호 발송")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                        .cornerRadius(10)
                })
                .padding(.vertical)
                .alert("인증번호가 발송되었습니다.", isPresented: $showSendSuccessModal){}
                .alert("등록되지 않은 메일입니다. 다시한번 확인해주세요.", isPresented: $showSendFailModal){}
                
                SecureField("인증번호 작성", text: $certificationNumber)
                    .autocapitalization(.none)
                    .padding(.horizontal, 60.0)
                    .textFieldStyle(.roundedBorder)
                
                
//
                if isSendedEmail == true {
                    Button(action: {
                        if certificationNumber == "12345" {
                            isAuthenticated = true
                            showSuccessAuthenticateModal = true
                        }
                        else {
                            isAuthenticated = false
                            showFailAuthenticateModal = true
                        }
                    }, label: {
                        Text("인증하기")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                            .cornerRadius(10)
                    })
                    .alert("인증되었습니다.", isPresented: $showSuccessAuthenticateModal){}
                    .alert("올바르지 않은 인증번호입니다. 다시 입력해주세요.", isPresented: $showFailAuthenticateModal){}
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
                if isAuthenticated == true && email != "" && certificationNumber != "" {
                    NavigationLink(destination: ResetPasswordView(users:users, email:email)) {
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


