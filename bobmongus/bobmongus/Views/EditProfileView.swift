//
//  EditProfileView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/06.
//

import SwiftUI

class User: ObservableObject {
    @Published var image = "mong1"
    @Published var nickname = "Nickname"
}

struct EditPasswordView: View {
    @State var showModal = false
    @State var editNicknameModal = false
    //각 모달창들의 Bool값
    
    @ObservedObject var user = User()
//    @State var userImage = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    VStack{
                        Text("프로필 변경")
                            .font(.custom("DungGeunMo", size: 40))
                    }
                    VStack{
                        Image(user.image)
                            .padding(.bottom)
                        Text(user.nickname)
                            .font(.custom("DungGeunMo", size: 30))
                    }
                    .padding(.vertical)
                    
                    VStack{
                        Button("프로필 사진 변경") {
//                            withAnimation {
//                                self.showModal.toggle()
                            showModal = true
                        }.font(.custom("DungGeunMo", size: 15))
                        
                    }
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.vertical)
                    
                    Button("닉네임 변경") {
                        editNicknameModal = true
                    }
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.custom("DungGeunMo", size: 15))
                }
                .padding(.vertical)
                
                ZStack{
                    if showModal {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .edgesIgnoringSafeArea(.all)
                        //모달창 배경
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .padding(.horizontal)
                                .frame(width: 390.0, height: 330.0)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                                .overlay(ModalContentView(showModal: self.$showModal)
                        )}
                        .transition(.move(edge: .bottom))
                    }   //모달창 배경 끝
                    
                }
                
                ZStack{
                    if editNicknameModal {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .edgesIgnoringSafeArea(.all)
                        //모달창 배경
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .padding(.horizontal)
                                .frame(width: 390.0, height: 330.0)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                                .overlay(EditNicknameView(editNicknameModal: self.$editNicknameModal))
                        }
                        .transition(.move(edge: .bottom))
                        
                    }
                }
                
            }
            
        }
        
    }
    
}


struct ModalContentView: View {
    @Binding var showModal: Bool
    @ObservedObject var user = User()
                                    
//    @Binding var userImage: String
    
    var body: some View {
//        var profileImage = user.image
        
        VStack(alignment: .leading) {
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.showModal.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                    Text("창 닫기")
                        .font(.custom("DungGeunMo", size: 17))
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            
            VStack{
                HStack(alignment: .center){
                    Spacer()
                    Button(action: {
                        self.user.image = "mong1"
                    }){Image("mong1")}
                    Spacer()
                    Button(action: {
                        self.user.image = "mong2"
                    }){Image("mong2")}
                    Spacer()
                    Button(action: {
                        self.user.image = "mong3"
                    }){Image("mong3")}
                    Spacer()
                }
                .padding(.top)
                HStack{
                    Spacer()
                    Button(action: {
                        self.user.image = "mong4"
                    }){Image("mong4")}
                    Spacer()
                    Button(action: {
                        self.user.image = "mong5"
                    }){Image("mong5")}
                    Spacer()
                    Button(action: {
                        self.user.image = "mong6"
                    }){Image("mong6")}
                    Spacer()
                }
                .padding(.bottom)
                
            }

            VStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        //self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .imageScale(.large)
                        Text("변경할 프로필 사진을 터치해주세요")
                            .fontWeight(.bold)
                            .font(.custom("DungGeunMo", size: 17))
                        
                    }
                    .padding(10.0)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(lineWidth: 2)
//                    )
                }
                .foregroundColor(.purple)
                Spacer().frame(maxWidth:.infinity)
            }
        }.padding(30)
    }
}

struct EditNicknameView: View {
    @State private var editedNickname = ""
    @Binding var editNicknameModal: Bool
    
    @ObservedObject var user = User()
    
    var body: some View {
        var originNickname = user.nickname
        VStack(alignment: .leading) {
            Spacer()
            Button(action: {
                withAnimation {
                    self.editNicknameModal.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                    Text("창 닫기")
                        .font(.custom("DungGeunMo", size: 17))
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)

            Text("변경하실 닉네임을 입력해주세요")
                .font(.custom("DungGeunMo", size: 17))
                .padding(.top)

            TextField("변경할 닉네임", text: $editedNickname)
                .textFieldStyle(.roundedBorder)
                .font(.custom("DungGeunMo", size: 16))
                .padding(.bottom)
            
            
            //이버튼을 방 내부와 연결하면 될 듯
            //문제3 버튼 정렬만 센터로 따로 설정하는법 현재 VStack으로 왼쪽정렬로 고정함
            VStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        //self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Button("닉네임 변경"){
                            var originNickname = editedNickname
                        }
                        .font(.custom("DungGeunMo", size: 17))
//                        Image(systemName: "fork.knife")
//                            .imageScale(.large)
//                        Text("닉네임 변경")
//                            .fontWeight(.bold)
                        
                    }
                    .padding(10.0)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                }
                .foregroundColor(.purple)
                Spacer().frame(maxWidth:.infinity)
            }
        }.padding(30)
    }
}


struct EditPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EditPasswordView()
    }
}
