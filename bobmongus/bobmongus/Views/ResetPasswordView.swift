
//
//  ResetPasswordView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//
import SwiftUI

struct ResetPasswordView: View {
//    @StateObject var dataManager = DataManager()
//    @StateObject var userList = UserLists()
    
//    @ObservedObject var users: User
    @Environment(\.rootPresentationMode) var rootPresentationMode: Binding<RootPresentationMode>
    
    @EnvironmentObject var modelData: ModelData
    
    var email: String
    
    @State var id = 0
    @State private var password = ""
    @State private var checkpassword = ""
    @State private var passwordResetSuccess = false
    @State private var passwordResetFail = false
    @State private var passwordAuth = false
//    @State var email = "hyuryu22@pos.idserve.net"
//    @ObservedObject var datas = ReadData()
    @State var showDetail = false
    
    var body: some View {
        VStack{
            
            
            Image("bobmong")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.bottom, 60.0)
            
            HStack {
                Text("새 비밀번호")
                    .font(.custom("DungGeunMo", size: 15))
                    .padding(.horizontal)
                    .padding(.trailing, 5.0)
                SecureField("비밀번호 입력", text: $password)
                    .padding(.trailing)
//                .textFieldStyle(.roundedBorder)
            }.padding(.horizontal, 60.0)
            Divider()
                .frame(width: 320,height: 1)
                .padding(.bottom, 15)
            
            HStack {
                Text("재확인")
                    .font(.custom("DungGeunMo", size: 15))
                    .padding(.horizontal)
                    .padding(.trailing, 43.0)
                SecureField("비밀번호 재입력", text: $checkpassword)
                    .padding(.trailing)
//                .textFieldStyle(.roundedBorder)
            }.padding(.horizontal, 60.0)
            Divider()
                .frame(width: 320,height: 1)
            
            
            VStack {
//                NavigationLink(destination: AuthenticationView(), isActive: $showDetail) {EmptyView()}
                Button(action:{
                    if password == checkpassword {
                        for i in modelData.users.indices {
                            if modelData.users[i].email == email {
                                modelData.users[i].password = password
                                passwordAuth = true
                                passwordResetSuccess = true
//                                showDetail = true
                                
                                
                            }
                        }
                    }
                    else {
                        passwordAuth = false
                        passwordResetFail = true
                    }
                }){
                    HStack {
                        Text("비밀번호 변경")
                            .font(.custom("DungGeunMo", size: 20))
                    }.padding(10.0)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .shadow(color:.black, radius: 0, x:2 ,y: 3)
                            .foregroundColor(Color(red: 0.6352941176470588, green: 0.396078431372549, blue: 0.7372549019607844))
                        )
                }
                .foregroundColor(Color.white)
            }
            .navigationTitle("비밀번호 초기화")
            .navigationBarTitleDisplayMode(.inline)
            .alert("비밀번호가 변경되었습니다.", isPresented: $passwordResetSuccess){
                Button("OK", role: .cancel) {
//                    showDetail = true
                    self.rootPresentationMode.wrappedValue.dismiss()
                }
            }
            .alert("비밀번호가 다르게 입력되었습니다. 다시 입력해주세요.", isPresented: $passwordResetFail){}
            .padding(.vertical)
            .padding(.bottom, 250)

        }
        
    }
    
}




struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(email: "bigsun1@gmail.com")
            .environmentObject(ModelData())
    }
}