//
//  LoginView.swift
//  LoginTest
//
//  Created by Chicken on 2022/04/04.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user: User
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isStored = false
    @State private var showingMainView = false
    @State private var showingAlert = false
    
    func authenticateUser(email: String, password: String) {
        for i in user.userList.indices {
            if email.lowercased() == user.userList[i].email.lowercased() && password.lowercased() == user.userList[i].password.lowercased() {
                showingMainView = true
                showingAlert = false
                return
            }
        }
        showingAlert = true
    }
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width / 390 * 285
        let height = UIScreen.main.bounds.height / 844 * 40
        
        VStack {
            Image("밥몽어스")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .padding(.bottom, 30)
            
            VStack(alignment: .leading) {
                TextField("email", text: $email)
                    .padding()
                    .frame(width: width, height: height)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray, lineWidth: 0.2))
                    .padding(.bottom, 5)
                
                SecureField("password", text: $password)
                    .padding()
                    .frame(width: width, height: height)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray, lineWidth: 0.2))
                    .padding(.top, 5)
                
                Toggle(isOn: $isStored) {
                    Text("로그인 정보 저장")
                        .font(.custom("DungGeunMo", size: 15))
                }
                .toggleStyle(CheckboxStyle())
                .padding()
                .offset(x: -13)
            }
            
            VStack {
                Button("로그인") {
                    authenticateUser(email: email, password: password)
//                    for i in user.userList.indices {
//                        print(user.userList[i])
//                    }
                }
                .font(.custom("DungGeunMo", size: 20))
                .foregroundColor(.white)
                .frame(width: 155, height: 50)
                .background(Color(red: 0.534, green: 0.189, blue: 0.488))
                .cornerRadius(8)
                .shadow(color:.black, radius: 0, x:2 ,y: 3)
                .padding()
                
                
                NavigationLink(destination: TempMainView(), isActive: $showingMainView) {
                    EmptyView()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("알림"), message: Text("이메일과 비밀번호를 확인해주세요."), dismissButton: .default(Text("닫기")))
                }
                
                NavigationLink(destination: TempPasswordView(), isActive: $showingMainView) {
                    Text("비밀번호 찾기")
                        .font(.custom("DungGeunMo", size: 15))
                        .foregroundColor(.secondary)
                        .frame(width: 105, height: 22)
                        .padding(5)
                }
                
                NavigationLink(destination: PrivacyPolicyView(user: user)
                    .navigationTitle("개인정보이용동의")
                    .navigationBarTitleDisplayMode(.inline))
                {
                    Text("계정이 없다면? 회원가입 하러가기")
                        .font(.custom("DungGeunMo", size: 15))
                        .foregroundColor(.secondary)
                        .frame(width: 242, height: 22)
                        .padding(5)
                }
            }
        }
        .navigationBarHidden(true)
        .offset(y: -50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(user: User())
    }
}
