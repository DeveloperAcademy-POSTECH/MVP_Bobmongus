//
//  ModalView.swift
//  bobmongus
//
//  Created by baek seohyeon on 2022/04/12.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    //초기값 2명으로 설정
    @State private var sleepAmount = 2
    //초기값 0분으로 설정
    @State private var time = 0
    //초기값 현재시간으로 설정
    //@State private var currentDate = Date()
    
    
    var body: some View {
        //모달창 내부 시작
        VStack(alignment: .leading) {
            Spacer()
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
            
            Stepper(value: $time, in: 0...60 ,step: 5) {
                Image(systemName: "timer")
                Text("마감시간 \(time)분")
                    .font(.custom("DungGeunMo", size: 17))
            }
//            DatePicker(selection: $currentDate, displayedComponents: .hourAndMinute, label: {
//                Image(systemName: "timer")
//                Text("마감시간설정")
//                    .font(.custom("DungGeunMo", size: 17))
//            })
            //모달창 내부 끝
            
            
            //방만들기 버튼
            VStack {
                Button(action: {
                    withAnimation {
                        //방내부로 이어지는 네비게이션 링크 넣어야함
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
                                .shadow(color:.black, radius: 0, x:2 ,y: 3)

                                .foregroundColor(Color(red: 0.982, green: 0.71, blue: 0.629))
                        )
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                //버튼 중앙배치
                Spacer().frame(maxWidth:.infinity)
            }
            .padding(.top, 5.0)
            //Vstack기준 10개 넘기면 에러 Extra argument in call
        }.padding(.horizontal, 20)
    }
}
