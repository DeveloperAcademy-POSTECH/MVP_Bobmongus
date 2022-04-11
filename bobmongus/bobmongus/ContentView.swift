//
//  ContentView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    @State var showModal: Bool = false
    
    var body: some View {
        //네비게이션 뷰 시작
        NavigationView {
            ZStack {
                //방만들기 버튼
                Image("background-iPhone 13")
                Button(action: {
                    withAnimation {
                        self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                        Text("방만들기")
                    }
                }
                //방만들기 버튼 끝
                
                //모달 창 시작
                if showModal {
                    //모달창 백그라운드
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.6))
                        .edgesIgnoringSafeArea(.all)
                    //모달창
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 350.0, height: 340.0)
                            .foregroundColor(Color.white)
                            .overlay(ModalContentView(showModal: self.$showModal))
                    }
                    //.transition(.move(edge: .bottom))
                }
                //모달창 배경 끝
            }
            //네비게이션 타이틀은 투명도(모달처리) 안됨
            .navigationBarTitle("room list back")
        }
        //한 번에 하나의 상위 뷰만 표시하는 뷰 스택으로 표시되는 탐색 뷰 스타일
        .navigationViewStyle(StackNavigationViewStyle())
    }
    //네비게이션 뷰 끝
}

struct ModalContentView: View {
    @Binding var showModal: Bool
    //초기값 2명으로 설정
    @State private var sleepAmount = 2
    //초기값 현재시간으로 설정
    @State private var currentDate = Date()
    
    
    var body: some View {
        //모달창 내부 시작
        VStack(alignment: .leading) {
            Button {
                withAnimation {
                    self.showModal.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(Color.red)
                    Text("창 닫기")
                        .font(.custom("DungGeunMo", size: 17))
                }.foregroundColor(Color.black)
            }
            .padding(.vertical, 10.0)

            TextField("방 제목", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            TextField("세부 설명 (만남 위치, 배달비 등등)", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            TextField("카카오톡 오픈채팅 주소", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            
            Stepper(value: $sleepAmount, in: 2...6) {
                Image(systemName: "person.fill")
                Text("\(sleepAmount)명(본인포함)")
                    .font(.custom("DungGeunMo", size: 17))
            }
            .padding(.top, 10.0)
            
            DatePicker(selection: $currentDate, displayedComponents: .hourAndMinute, label: {
                Image(systemName: "timer")
                Text("마감시간설정")
                    .font(.custom("DungGeunMo", size: 17))
            })
            //모달창 내부 끝
            
            
            //방만들기 버튼
            VStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        //self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .imageScale(.medium)
                            
                        Text("방 만들기")
                            .font(.custom("DungGeunMo", size: 20))
                    }.padding(10.0)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                //.stroke(lineWidth: 2)
                                .shadow(color:.black, radius: 0, x:2 ,y: 3)

                                .foregroundColor(Color(red: 0.6352941176470588, green: 0.396078431372549, blue: 0.7372549019607844))
                               
                        )
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                Spacer().frame(maxWidth:.infinity)
            }
            .padding(.top, 5.0)
            //Vstack기준 10개 넘기면 에러 Extra argument in call
        }.padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
