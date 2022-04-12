//
//  MypageView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/06.
//
import SwiftUI

struct MypageView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    
    @State private var showingAlert = false
    //기존 프로필 이미지 편의상 mong1로 설정
    //이미지파일 이름 통일시켜야 함
    
    //    @State private var nickname = "Nickname"
    //기존 유저 닉네임 편의상 Nickname으로 설정
    
    var body: some View {
        VStack {
            Text("My Page")
                .padding(.bottom)
                .font(.custom("DungGeunMo", size: 60))
            
            VStack {
                VStack {
                    Image(modelData.myProfile.icon)
                    Text(modelData.myProfile.email)
                        .fontWeight(.medium)
                        .padding(.vertical)
                        .font(.custom("DungGeunMo", size: 30))
                    Text(modelData.myProfile.nickName)
                        .fontWeight(.medium)
                        .padding(.bottom)
                        .font(.custom("DungGeunMo", size: 30))
                }
                
                VStack {
                    NavigationLink(destination:EditProfileView())
                            {
                            Text("프로필 변경")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 135, height: 50)
                                .font(.custom("DungGeunMo", size: 17))
                        }
                        .background(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(Color(red: 0.471, green: 0.222, blue:0.546))
                    
                    NavigationLink(destination:EditPasswordView()) {
                            Text("비밀번호 변경")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 135, height: 50)
                                .font(.custom("DungGeunMo", size: 17))
                        }
                        .background(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(Color(red: 0.471, green: 0.222, blue:0.546))
                        .padding(.vertical)
                    
                    Button("로그아웃") {
                        modelData.myProfile.isLogin = false
                        //MARK: pop to root
                        self.rootPresentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.957, green: 0.957, blue: 0.965))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                    //                        .padding(.vertical)
                    
                    VStack {
                        
                        Button("탈퇴") {
                            self.showingAlert = true
                        }
                        .font(.custom("DungGeunMo", size: 17))
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("회원 탈퇴"), message: Text("정말 탈퇴하시겠습니까?"),
                              primaryButton:
                                .destructive(Text("탈퇴"), action: {
                                    // Some action
                                    // json 파일에서 회원 정보 삭제
                                }),
                              secondaryButton:
                                .default(Text("아니오"))
                        )
                    }
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.957, green: 0.957, blue: 0.965))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                    .padding(.vertical)
                }
            }
        }
    }
    
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
            .environmentObject(ModelData())
    }
}
