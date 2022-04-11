//
//  TestRoomListView.swift
//  Tamongus
//
//  Created by Hyeonsoo Kim on 2022/04/11.
//

import SwiftUI

struct TestRoomListView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var showModal: Bool = false
    @State var isMake: Bool = false
    @State var newRoom: Room = Room(id: 100, isStart: false, roomTitle: "title", roomDetail: "detail", nowPersons: [], persons: 100, endTime: 100, linkURL: "linkURL")
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    HStack { // 상단 설명 아이콘 영역
                        VStack {
                            Image("mainPeople")
                                .resizable().frame(width: 46, height: 46)
                            .padding(.leading, 20)
                        }
                        Spacer()
                        Image("mainTitle")
                            .resizable().frame(width: 64, height: 64)
                        Spacer()
                        Image("mainBoom")
                            .resizable().frame(width: 48, height: 46)
                            .padding(.trailing, 20)
                    } // HStack end
                    ScrollView {
                        
                        VStack {
                            
                            if modelData.rooms.count != 0 {
                                
                                ForEach(0...modelData.rooms.count-1, id: \.self) { index in
                                    
                                    NavigationLink {
                                        
                                        TestRoomView(room: $modelData.rooms[index])
                                            .navigationBarTitleDisplayMode(.inline)
                                        
                                    } label: {
                                        
                                        TestRoomCell(room: modelData.rooms[index])
                                        
                                    }
                                }
                            }
                            
                            NavigationLink(isActive: $isMake) {
                                
                                TestRoomView(room: $newRoom)
                                    .navigationBarTitleDisplayMode(.inline)
                                
                            } label: {
                                
                                EmptyView()
                            }
                        }   // VStack(Rooms) end
                    }   // ScrollView end
                }   // VStack end
                .navigationBarHidden(true)
                .background(
                    Image("mainBackground")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                )
                
                VStack {
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            
                            self.showModal.toggle()
                            
                        }
                    } label: {
                        
                        HStack {
                            
                            Image(systemName: "plus.circle.fill")
                                .imageScale(.large)
                            
                            Text("방만들기")
                            
                        }
                    }
                }
                
                if showModal {
                    
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.6))
                        .edgesIgnoringSafeArea(.all)
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 16)
                            .padding(.horizontal)
                            .frame(width: 390.0, height: 330.0)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                            .overlay {
                                TestRoomMakingView(showModal: $showModal, isMake: $isMake, newRoom: $newRoom)
                                
                            }
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct TestRoomCell: View {
    
    @State var room: Room
    
    var body: some View {
        
        let lightPurple = "#A265BC"
        
        ZStack {
            
            RoomCellShape()
                .foregroundColor(Color(hex: lightPurple))
            
            HStack {
                
                Text("\(room.nowPersons.count)/\(room.persons)")
                
                Divider()
                Spacer()
                
                Text(room.roomTitle)
                
                Spacer()
                Divider()
                
                Text("\(room.endTime)")
    
            }
            .foregroundColor(.white)
            .padding()
            
        }
        .padding(.horizontal)
    }
}

struct TestRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomListView(newRoom: ModelData().rooms[0])
            .environmentObject(ModelData())
    }
}
