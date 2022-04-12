//
//  EditProfileView.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/12.
//

import SwiftUI

struct EditPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData: ModelData
    
    @State private var checkPassword = false
    @State private var editPassword = false
    @State private var canEditPassword = false
    
    //    @State private var originPassword = "123"
    //여기서는 대충 원래 비밀먼호가 123이라고 설정
    @State private var typedPassword = ""
    
    @State private var newPassword1 = ""
    @State private var newPassword2 = ""
    
    
    
    var body: some View {
        VStack {
            VStack {
                Text("비밀번호 변경")
                    .font(.custom("DungGeunMo", size: 40))
            }
            Spacer().frame(height: 100)
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("기존 비밀번호 확인")
                        .font(.custom("DungGeunMo", size: 20))
                        .padding(.horizontal)
                    
                    TextField("기존 비밀번호를 입력해주세요", text: $typedPassword)
                        .modifier(ClearButton(text: $typedPassword))
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .font(.custom("DungGeunMo", size: 16))
                }.padding()
                
                Button("비밀번호 확인") {
                    self.checkPassword = true
                    
                    if typedPassword == modelData.myProfile.password {
                        canEditPassword = true
                    }
                }
                .font(.custom("DungGeunMo", size: 17))
                .alert(isPresented: $checkPassword) {
                    if typedPassword == modelData.myProfile.password {
                        
                        return Alert(title: Text("비밀번호 일치"), message: Text("비밀번호가 일치합니다!"), dismissButton: .default(Text("확인")))
                    }
                    else {
                        return Alert(title: Text("비밀번호 불일치"), message: Text("비밀번호를 다시 입력해주세요!"), dismissButton: .default(Text("확인")))
                    }
                }
                .padding(.vertical)
                .frame(width: 135.0, height: 50.0)
                .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.bottom, 20.0)
            
            if canEditPassword {
                VStack {
                    VStack(alignment: .leading) {
                        Text(/*@START_MENU_TOKEN@*/"새 비밀번호"/*@END_MENU_TOKEN@*/).font(.custom("DungGeunMo", size: 20))
                            .padding(.horizontal)
                        TextField("새 비밀번호를 입력해주세요", text: $newPassword1).font(.custom("DungGeunMo", size: 17))
                            .padding(.horizontal)
                            .modifier(ClearButton(text: $newPassword1))
                        //binding으로 받아야 함
                        TextField("다시 입력해주세요", text: $newPassword2).font(.custom("DungGeunMo", size: 17))
                            .padding(.horizontal)
                            .modifier(ClearButton(text: $newPassword2))
                        
                    }
                    .padding()
                    
                    .textFieldStyle(.roundedBorder)
                    
                    
                    Button("비밀번호 변경") {
                        self.editPassword = true
                        if newPassword1 == newPassword2 {
                            modelData.myProfile.password = newPassword1
                            print(modelData.myProfile.password)
                        }
                    }.font(.custom("DungGeunMo", size: 17))
                    
                        .alert(isPresented: $editPassword) {
                            if newPassword1 == newPassword2 {
                                
                                return Alert(title: Text("비밀번호 변경"), message: Text("비밀번호가 변경되었습니다!"), dismissButton: .default(Text("확인"), action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }))
    
                            } else {
                                return Alert(title: Text("비밀번호 변경"), message: Text("비밀번호가 일치하지 않습니다."), dismissButton: .default(Text("확인")))
                            }
                        }
                    //비밀번호 일치할 때 화면만 세팅해놨음
                    //두개 비밀번호 일치하지 않을 경우 구현 필요
                    
                    //
                        .padding(.vertical)
                        .frame(width: 135.0, height: 50.0)
                        .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {}
        }
        
    }
}
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditPasswordView()
            .environmentObject(ModelData())
    }
}
