//
//  TestRoomVIew.swift
//  Tamongus
//
//  Created by Hyeonsoo Kim on 2022/04/11.
//

import SwiftUI

struct TestRoomView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var isClick: Bool = false
    
    @EnvironmentObject var modelData: ModelData
    @State private var confirmationShown = false
    
    @Binding var room: Room
    
    var roomIndex: Int {
        modelData.rooms.firstIndex(where: { $0.id == room.id })!
    }
    
    var myIndex: Int {
        room.nowPersons.firstIndex(where: { $0.id == modelData.myProfile.id })!
    }
    
    var customBackButton: some View {
        
        Button {
            
            if room.isStart {
                
                self.confirmationShown.toggle()
                
            } else {
                
                modelData.myProfile.isReady ? print("못나갑니다.") :
                self.confirmationShown.toggle()
                
            }
        } label: {
            
            if room.isStart {
                
                Text("완료")
                    .font(.custom("DungGeunMo", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding([.top, .bottom], 5)
                    .background(Capsule()
                        .foregroundColor(Color(hex: "#A265BC")))
                
            } else if modelData.myProfile.isReady {
                
                Text("나가기")
                    .font(.custom("DungGeunMo", size: 15))
                    .foregroundColor(.white)
                    .hidden()
                
            } else {
                
                Text("나가기")
                    .font(.custom("DungGeunMo", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding([.top, .bottom], 5)
                    .background(Capsule()
                        .foregroundColor(.red.opacity(0.8)))
            }
        }
        .modifier(ConfirmationDia(confirmationShown: $confirmationShown))
    }

    var body: some View {
        
        let lightPurple = "#A265BC"
        
        ZStack {
            
            Image("tree")
                .resizable()
                .clipped()
                .edgesIgnoringSafeArea([.top, .bottom])
            
            VStack {
                
                Spacer().frame(height: 30)
                
                Button {
                    
                    self.isClick.toggle()
                    
                } label: {
                    
                    (
                        
                        isClick ?
                        Text(room.roomDetail)
                            .foregroundColor(.secondary)
                            .font(.custom("DungGeunMo", size: 12))
                        :
                            Text("상세설명")
                            .foregroundColor(Color(hex: lightPurple))
                            .font(.custom("DungGeunMo", size: 17))
                        
                    )
                    .padding()
                }
                
                Spacer().frame(height: 30)
                
                if room.nowPersons.count != 0 {
                    if room.nowPersons.count <= 3 {
                        
                        HStack(spacing: 20) {
                            
                            ForEach(0...room.nowPersons.count-1, id: \.self) { index in
                                TestUserCell(room: $room, user: $room.nowPersons[index])
                                
                            }
                        }
                    } else {
                        
                        VStack(alignment: .leading, spacing: 30) {
                            
                            HStack(spacing: 20) {
                                ForEach(0...2, id: \.self) { index in
                                    TestUserCell(room: $room, user: $room.nowPersons[index])
                                }
                            }
                            
                            HStack(spacing: 20) {
                                ForEach(3...room.nowPersons.count - 1, id: \.self) { index in
                                    TestUserCell(room: $room, user: $room.nowPersons[index])
                                }
                            }
                        }
                    }
                }
                
                Group {
                    
                    Spacer().frame(height: 30)
                    
                    Divider()
                    
                    Spacer().frame(height: 30)
                    
                    if room.isStart {
                        
                        HStack {
                            
                            Text("링크 Click ! : ")
                                .font(.custom("DungGeunMo", size: 17))
                                .fontWeight(.bold)
                            
                            Link(destination: (URL(string: room.linkURL) ?? URL(string: "https://www.naver.com"))!) {
                                
                                Text("Let's go openkakao")
                                    .font(.custom("DungGeunMo", size: 17))
                                    .foregroundColor(Color(hex: lightPurple))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        //If StartButton Tapped.
                        if (modelData.myProfile.isMakingRoom && (room.nowPersons.filter { $0.isReady == true }.count == room.nowPersons.count)) {
                            
                            room.isStart = true
                            
                        } else { //If didn't StartButton Tapped.
                        
                            //If I want to make allready, I must change rooms & myProfile.
                            room.nowPersons[myIndex].isReady.toggle()
                            modelData.myProfile.isReady.toggle()
                            
                        }
                        
                    } label: {
                        
                        modelData.myProfile.isMakingRoom ?
                        ( //If I made room.
                            modelData.myProfile.isReady ?
                            ( //If I'm ready.
                                room.nowPersons.filter {
                                    $0.isReady == true
                                }.count
                                == room.nowPersons.count ?
                                //If allReady.
                                Text("Start").font(.custom("DungGeunMo", size: 22))
                                :
                                    //If not allReady.
                                Text("UnReady").font(.custom("DungGeunMo", size: 22))
                            ) //If I'm not ready.
                            : Text("Ready").font(.custom("DungGeunMo", size: 22))
                        )
                        :
                        ( //If I didn't make room.
                            modelData.myProfile.isReady ?
                            Text("UnReady").font(.custom("DungGeunMo", size: 22)) :
                                Text("Ready").font(.custom("DungGeunMo", size: 22))
                        )
                    }
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 40)
                        .foregroundColor(Color(hex: lightPurple))
                        .shadow(color: .black, radius: 5, x: 3, y: 3))
                    
                    Spacer().frame(height: 30)
        
                }
            }
            .navigationTitle(room.roomTitle)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    customBackButton
                    
                }
            }
            .onAppear {
                
                room.nowPersons.append(modelData.myProfile)
                
            }
            .onDisappear {
                
                room.nowPersons.remove(at: myIndex)
                
                modelData.myProfile.isMakingRoom = false
                
                modelData.myProfile.isReady = false
                
//MARK: Method1 - 만약, 누군가 방을 생성하는 동시에 빈 방이 발생한다면, 그 방이 사라질 우려있음.
//                modelData.rooms = modelData.rooms.filter({ room in
//                    !room.nowPersons.isEmpty
//                })
                
//MARK: Method2 - Index로 이 방만을 판단하기. (성공 시 가장 바람직) - Success !
                if room.nowPersons.isEmpty {
                    modelData.rooms.remove(at: roomIndex)
                }
            }
        }
    }
}

struct TestRoomVIew_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomView(room: .constant(ModelData().rooms[0]))
            .environmentObject(ModelData())
    }
}
