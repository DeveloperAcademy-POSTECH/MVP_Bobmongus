//
//  TestRoomMakingView.swift
//  Tamongus
//
//  Created by Hyeonsoo Kim on 2022/04/11.
//

import SwiftUI

struct TestRoomMakingView: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var showModal: Bool
    @Binding var isMake: Bool
    @Binding var newRoom: Room
    
    @State var persons = 2
    @State var roomTime = Date()
    @State var roomTimeString = ""
    
    @State var roomTitle: String = ""
    @State var roomDetail: String = ""
    @State var linkURL: String = ""
    
    @State var endTime = 5
    
    var body: some View {
        
        let lightPurple = "#A265BC"
        
        VStack(alignment: .leading) {
            
            Spacer()
            
            Button {
                
                withAnimation {
                    self.showModal.toggle()
                }
                
            } label: {
                
                HStack {
                    
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                    
                    Text("창 닫기")
                        .font(.custom("DungGeunMo", size: 17))
                    
                }
            }
            .foregroundColor(Color(hex: lightPurple))
    
            TextField("방제목", text: $roomTitle)
                .modifier(ClearButton(text: $roomTitle))
                .textFieldStyle(.roundedBorder)
            
            TextField("세부설명", text: $roomDetail)
                .modifier(ClearButton(text: $roomDetail))
                .textFieldStyle(.roundedBorder)
            
            TextField("카카오톡 오픈채팅 주소", text: $linkURL)
                .modifier(ClearButton(text: $linkURL))
                .textFieldStyle(.roundedBorder)
            
            Stepper(value: $persons, in: 2...6) {
                            
                            Image(systemName: "person.fill")
                            
                            Text("\(persons)명 (본인포함)")
                                .font(.custom("DungGeunMo", size: 17))
                            
                        }
            
            Stepper(value: $endTime, in: 5...90, step: 5) {
                Image(systemName: "timer")
                Text("마감시간 \(endTime)분")
                    .font(.custom("DungGeunMo", size: 17))
            }
            
//            DatePicker(selection: $endTime, displayedComponents: .hourAndMinute, label: {
//
//                Image(systemName: "timer")
//
//                Text("마감시간설정")
//                    .font(.custom("DungGeunMo", size: 17))
//
//            })
            
            VStack(alignment: .center) {
                
                Button {
                    
                    modelData.myProfile.isMakingRoom = true
                    
                    let uuid = UUID()
                    
                    let room: Room = Room(id: uuid, isStart: false, roomTitle: roomTitle, roomDetail: roomDetail, nowPersons: [], persons: persons, endTime: endTime, linkURL: linkURL, roomTimeStr: roomTime.formatted(date: .omitted, time: .standard))
                    
                    modelData.rooms.append(room)
                    modelData.rooms = modelData.rooms.sorted(by: { //MARK: append할 때, sorted. Nice.
                        timeCal(room: $0) < timeCal(room: $1)
                    })
                    
                    self.showModal.toggle()
                    
                    self.newRoom = room
                    
                    self.isMake.toggle()
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "fork.knife")
                            .imageScale(.large)
                        
                        Text("방 만들기")
                            .font(.custom("DungGeunMo", size: 17))
                        
                    }
                    .padding(10.0)
                        .background(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                            
                        )
                }
                .foregroundColor(Color(hex: lightPurple))
                
                Spacer().frame(maxWidth:.infinity)
            }
        }
        .padding(30)
    }
}
