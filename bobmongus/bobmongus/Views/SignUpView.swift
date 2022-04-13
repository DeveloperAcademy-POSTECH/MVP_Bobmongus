
//  SignUpView.swift
//  LoginTest
//
//  Created by Chicken on 2022/04/06.
//
import SwiftUI

enum Address: String, CaseIterable, Identifiable {
    case one = "포스빌 1동"
    case two = "포스빌 2동"
    case three = "포스빌 3동"
    case four = "포스빌 4동"
    case five = "포스빌 5동"
    case six = "포스빌 6동"
    
    var id: String{ self.rawValue }
}

enum Gender: String, CaseIterable, Identifiable {
    case male
    case female
    
    var id: String{ self.rawValue }
}

struct SignUpView: View {
    
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
//    @ObservedObject var user: User
    @EnvironmentObject var modelData: ModelData
    
    @State private var selectedGender = Gender.male
    @State private var selectedAddr = Address.one
    
    @State private var sendNumberAlert = false
    @State private var checkNumberAlert = false
    @State private var nicknameAlert = false
    
    @State private var email = ""
    @State private var authNumber = ""
    @State private var password = ""
    @State private var passwordCheck = ""
    @State private var nickname = ""
    
    var body: some View {
//        let width = UIScreen.main.bounds.width / 390 * 70
//        let height = UIScreen.main.bounds.height / 844 * 30
        
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("이메일")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 30)
                    TextField("@pos.idserve.net", text: $email)
                    Button(action: {
                        self.sendNumberAlert = true
                    }) {
                        Text("인증번호전송")
                            .font(.custom("DungGeunMo", size: 10))
                            .fontWeight(.bold)
                            .frame(width: 70, height: 30)
                            .foregroundColor(.white)
                    }
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color(red: 0.534, green: 0.189, blue: 0.488))
                    .alert(isPresented: $sendNumberAlert) {
                        Alert(title: Text("알림"), message: Text("인증번호가 이메일로 전송되었습니다."), dismissButton: .default(Text("닫기")))
                    }
                }
                
                Divider()
                
                HStack {
                    Text("인증번호")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 16)
                    TextField("", text: $authNumber)
                    Button(action: {
                        self.checkNumberAlert = true
                    }) {
                        Text("인증번호확인")
                            .font(.custom("DungGeunMo", size: 10))
                            .fontWeight(.bold)
                            .frame(width: 70, height: 30)
                            .foregroundColor(.white)
                    }
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color(red: 0.534, green: 0.189, blue: 0.488))
                    .alert(isPresented: $checkNumberAlert) {
                        Alert(title: Text("알림"), message: Text("인증되었습니다."), dismissButton: .default(Text("닫기")))
                    }
                }
                
                Divider()
            }
            .padding(.bottom, 40)
            
            VStack {
                HStack {
                    Text("비밀번호")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 16)
                    SecureField("", text: $password)
                }
                .padding(.vertical, 5)
                Divider()
                
                HStack {
                    Text("재확인")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 30)
                    SecureField("", text: $passwordCheck)
                }
                .padding(.vertical, 5)
                Divider()
            }
            .padding(.bottom, 40)
            
            VStack {
                HStack {
                    Text("닉네임")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 30)
                    TextField("", text: $nickname)
                    
                    Button(action: {
                        self.nicknameAlert = true
                    }) {
                        Text("중복확인")
                            .font(.custom("DungGeunMo", size: 12))
                            .fontWeight(.bold)
                            .frame(width: 70, height: 30)
                            .foregroundColor(.white)
                    }
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color(red: 0.534, green: 0.189, blue: 0.488))
                    .alert(isPresented: $nicknameAlert) {
                        Alert(title: Text("확인"), message: Text("해당 닉네임은 사용 가능합니다."), dismissButton: .default(Text("닫기")))
                    }
                }
                Divider()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("성별")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 90)

                    Picker("성별", selection: $selectedGender) {
                        Text("남").tag(Gender.male)
                        Text("여").tag(Gender.female)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 0.2)
                    .frame(width: 120, height: 20))
                    
                    Image(systemName: "chevron.down.square.fill")
                        .foregroundColor(Color.blue)
                        .font(Font.system(size: 15, weight: .bold))
                        .padding(.leading)
                }

                HStack {
                    Text("거주지")
                        .font(.custom("DungGeunMo", size: 15))
                        .padding(.trailing, 59)
                    
                    HStack {
                        Picker("거주지", selection: $selectedAddr) {
                            Text("포스빌 1동").tag(Address.one)
                            Text("포스빌 2동").tag(Address.two)
                            Text("포스빌 3동").tag(Address.three)
                            Text("포스빌 4동").tag(Address.four)
                            Text("포스빌 5동").tag(Address.five)
                            Text("포스빌 6동").tag(Address.six)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.2)
                        .frame(width: 120, height: 20))
                        
                        Image(systemName: "chevron.down.square.fill")
                            .foregroundColor(Color.blue)
                            .font(Font.system(size: 15, weight: .bold))
                    }
                }
                .padding(.bottom, 80)
            }
            
            NavigationLink(destination: LoginView()) {
                Text("회원가입완료")
            }.simultaneousGesture(TapGesture().onEnded{
                
                modelData.users.append(Room.User(id: UUID(), email: email, password: password, icon: "bobmong", isLogin: false, isReady: false, isMakingRoom: false, nickName: nickname, userAddress: "포스빌 6동"))
                
                self.rootPresentationMode.wrappedValue.dismiss()
                
            })
            .font(.custom("DungGeunMo", size: 20))
            .foregroundColor(.white)
            .frame(width: 155, height: 50)
            .background(Color(red: 136/255, green: 0.189, blue: 0.488))
            .cornerRadius(8)
            .shadow(color:.black, radius: 0, x:2 ,y: 3)
            .padding()
            .offset(x: 85)
        }
        .padding()
//        .offset(y: -30)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(ModelData())
    }
}
