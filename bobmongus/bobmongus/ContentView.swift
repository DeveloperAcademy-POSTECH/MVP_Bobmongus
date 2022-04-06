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
                    //검은배경처리
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.6))
                        .edgesIgnoringSafeArea(.all)
                    //모달창 배경
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .padding(.horizontal)
                            .frame(width: 390.0, height: 330.0)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                            .overlay(ModalContentView(showModal: self.$showModal))
                    }
                    .transition(.move(edge: .bottom))
                }
                //모달창 배경 끝
            }
            //문제1 네비게이션으로 작업해서 모달처리해도 타이틀은 고정됨
            //안토니가 네비게이션 타이틀로 했을 시 그부분은 투명도(모달처리) 안됨
            .navigationBarTitle("room list back")
        }
        //문제2 기능 확인
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
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            
            TextField("방제목", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            TextField("세부설명", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            TextField("카카오톡 오픈채팅 주소", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            
            Stepper(value: $sleepAmount, in: 2...6) {
                Image(systemName: "person.fill")
                Text("\(sleepAmount)명 (본인포함)")
            }
            
            DatePicker(selection: $currentDate, displayedComponents: .hourAndMinute, label: {
                Image(systemName: "timer")
                Text("마감시간설정")
            })
            
            
            //이버튼을 방 내부와 연결하면 될 듯
            //문제3 버튼 정렬만 센터로 따로 설정하는법 현재 VStack으로 왼쪽정렬로 고정함
            VStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        //self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .imageScale(.large)
                        Text("방 만들기")
                            .fontWeight(.bold)
                        
                    }.padding(10.0)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                        )
                }
                .foregroundColor(.purple)
                Spacer().frame(maxWidth:.infinity)
            }
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
