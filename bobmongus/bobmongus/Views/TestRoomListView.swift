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
                        }
                    }
                }
                
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
                        
                        let width = UIScreen.main.bounds.width
                        
                        RoundedRectangle(cornerRadius: 16)
                            .padding(.horizontal)
                            .frame(width: width, height: width / 13 * 11) //aspect
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
