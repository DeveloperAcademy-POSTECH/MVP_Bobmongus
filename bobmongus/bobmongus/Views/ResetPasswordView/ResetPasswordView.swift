//
//  ResetPasswordView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State var password = ""
    @State var checkpassword = ""
    
//    @ObservedObject var datas = ReadData()
    
    
    var body: some View {
        VStack{
            Image("logo-img")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.bottom, 100.0)
            
            HStack {
                Text("새 비밀번호")
                    .padding()
                SecureField("비밀번호 입력", text: $password)
                    .padding(.trailing)
                .textFieldStyle(.roundedBorder)
            }.padding(.horizontal, 60.0)
            
            
            HStack {
                Text("비밀번호 확인")
                    .padding()
                SecureField("비밀번호 재입력", text: $checkpassword)
                    .padding(.trailing)
                .textFieldStyle(.roundedBorder)
            }.padding(.horizontal, 60.0)
            
            
            Button(action: {
            }, label: {
                Text("로그인하기")
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
