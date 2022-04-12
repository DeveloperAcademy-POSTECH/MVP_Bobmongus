//
//  EntranceView.swift
//  LoginTest
//
//  Created by Chicken on 2022/04/06.
//

import SwiftUI

struct EntranceView: View {
    @StateObject var user = User()
    
    var body: some View {
        NavigationView {
            VStack {
                // 이미지
                Image("밥몽어스")
//                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                
                // 로그인 버튼
                NavigationLink(destination: LoginView(user: user).navigationBarHidden(true)) {
                    Text("로그인")
                }
                .font(.custom("DungGeunMo", size: 20))
                .foregroundColor(.black)
                .frame(width: 135, height: 50)
                .background(Color(red: 0.937, green: 0.937, blue: 0.942))
                .cornerRadius(8)
                .shadow(color:.black, radius: 0, x:2 ,y: 3)
                .padding(.bottom, 5)
                
                // 회원가입 버튼
                NavigationLink(destination: PrivacyPolicyView(user: user).navigationTitle("개인정보이용동의").navigationBarTitleDisplayMode(.inline)) {
                        Text("회원가입")
                }
                .font(.custom("DungGeunMo", size: 20))
                .foregroundColor(.white)
                .frame(width: 135, height: 50)
                .background(Color(red: 0.534, green: 0.189, blue: 0.488))
                .cornerRadius(8)
                .shadow(color:.black, radius: 0, x:2 ,y: 3)
                
            }
            .offset(y: -50)
        }
    }
}

struct EntranceView_Previews: PreviewProvider {
    static var previews: some View {
        EntranceView()
    }
}
