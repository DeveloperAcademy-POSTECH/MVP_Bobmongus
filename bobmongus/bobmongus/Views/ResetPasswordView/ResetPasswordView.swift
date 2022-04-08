//
//  ResetPasswordView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//

import SwiftUI

struct ResetPasswordView: View {
    @StateObject var dataManager = DataManager()
    @State private var password = ""
    @State private var checkpassword = ""
    @State private var passwordResetSuccess = false
    @State private var passwordResetFail = false
    @State private var passwordAuth = false
    @State var email = "hyuryu22@pos.idserve.net"
//    @ObservedObject var datas = ReadData()
    
    
    var body: some View {
        VStack{
//            확인!
            ForEach(dataManager.jsonArray) { jsonValue in
                            Text("Username is \(jsonValue.password)")
                        }
            
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
                if password == checkpassword {
                    
//                  데이터 쓰기
                    for i in dataManager.jsonArray.indices {
                        print(dataManager.jsonArray[i].password)
                        if dataManager.jsonArray[i].email == email {
                            print(dataManager.jsonArray[i].password)
                            dataManager.jsonArray[i].password = password
                            dataManager.saveToFile()
                            passwordAuth = true
                            passwordResetSuccess = true
                            break
                        }
                    }
                }
                else {
                    passwordAuth = false
                    passwordResetFail = true
                }
                
            }, label: {
                Text("비밀번호 초기화")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.519, green: 0.24, blue: 0.527))
                    .cornerRadius(10)
            })
            .alert("비밀번호가 변경되었습니다.", isPresented: $passwordResetSuccess){}
            .alert("비밀번호가 다르게 입력되었습니다. 다시 입력해주세요.", isPresented: $passwordResetFail){}
            .padding(.vertical)
        }
        
        

    }
}




struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
