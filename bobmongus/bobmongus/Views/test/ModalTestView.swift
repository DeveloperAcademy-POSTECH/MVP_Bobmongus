//
//  ModalTestView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/08.
//

import SwiftUI

struct ModalTestView: View {
    @State var showModal: Bool = false
    
    var body: some View {
        HStack {
            NavigationView{
                ZStack{
                    VStack{
                        Button("modal") {
                            withAnimation {
                                self.showModal.toggle()
                            }
                        }
                        Button("modal") {
                            withAnimation {
                                self.showModal.toggle()
                            }
                        }
                        Text("HI")
                        Text("HI")
                        Text("HI")
                        Text("HI")
                        Text("HI")

                    }
                    
                    
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
                                                
                                .overlay(ModalContentsView(showModal: self.$showModal))
                                        }
                                        
                        .transition(.move(edge: .bottom))
                                    
                    }
                }
            }
            
        }
        
    }
}

struct ModalContentsView: View {
    @Binding var showModal: Bool
    
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
            
            VStack{
                HStack{
                    Image("mong1")
                    Image("mong2")
                    Image("mong3")
                }
                HStack{
                    Image("mong4")
                    Image("mong5")
                    Image("mong6")
                }
            }

//            TextField("방제목", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                .textFieldStyle(.roundedBorder)
//            TextField("세부설명", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                .textFieldStyle(.roundedBorder)
//            TextField("카카오톡 오픈채팅 주소", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                .textFieldStyle(.roundedBorder)
            
            
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

struct ModalTestView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTestView()
    }
}
