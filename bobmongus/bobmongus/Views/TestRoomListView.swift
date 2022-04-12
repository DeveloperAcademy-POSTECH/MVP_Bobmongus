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
        // height: 실행중인 아이폰의 세로길이를 11로 나눈 값
        let height = (UIScreen.main.bounds.height) / 11
        
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
                            // 생성된 방을 불러온다.
                            ForEach(0..<modelData.rooms.count, id: \.self) { index in
                                
                                NavigationLink {
                                    
                                    TestRoomView(room: $modelData.rooms[index])
                                        .navigationBarTitleDisplayMode(.inline)
                                    
                                } label: {
                                    TestRoomCell(room: modelData.rooms[index])
                                        .frame(height: height)  // 각 방의 세로 길이
                                    
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
                    // 하단부에 사라지는 효과를 위해 mask 사용
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .center, endPoint: .bottom))
                    
                    HStack {    // 하단부 버튼 영역
                        NavigationLink( // 마이페이지
                            destination: EmptyView(),
                            label: {
                                Image(systemName: "person.fill")
                                    .frame(width:46, height:46)
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .font(.largeTitle)
                                    .cornerRadius(6)
                                    .shadow(color: .primary, radius: 1, x: 2, y: 2)
                                    .padding(.top, 5)
                            }
                        )
                        .padding(.leading, 40)
                        Spacer()
                        
                        Button {
                            withAnimation {
                                
                                self.showModal.toggle()
                                
                            }
                        } label: {
                            
                            HStack {
                                
                                Text("방만들기")
                                    .frame(width:140, height:45)
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .font(.custom("DungGeunMo", size: 32))
                                    .cornerRadius(6)
                                    .shadow(color: .primary, radius: 1, x: 2, y: 2)
                                    .padding(.top, 5)
                                
                            }
                        }
                        
                        Spacer()

                        Button {
                            print()
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                                .padding(40)
                                .frame(width:45, height:45)
                                .foregroundColor(.white)
                                .background(.purple)
                                .font(.largeTitle)
                                .cornerRadius(6)
                                .shadow(color: .primary, radius: 1, x: 2, y: 2)
                                .padding(.top, 5)
                                
                        }
                        .padding(.trailing, 40)
                    }   // HStack end
                }   // VStack end
                .navigationBarHidden(true)
                .background(
                    Image("mainBackground")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                )
                
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
        
        ZStack {
            RoomCellShape() // 방 모양 생성
                .foregroundColor(.white)
            HStack {
                Text("\(room.nowPersons.count)/\(room.persons)") // 인원수
                    .font(.custom("DungGeunMo", size: 20))
                    .frame(width: 40)
                
                Rectangle() // Devider
                    .fill(Color.black)
                    .frame(width: 2, height: 40)
                Spacer()
                Text(room.roomTitle) // 방 타이틀
                    .font(.custom("DungGeunMo", size: 20))
                Spacer()
                Rectangle() // Devider
                    .fill(Color.black)
                    .frame(width: 2, height: 40)
                Text("\(room.endTime)분") // 방 남은시간
                    .font(.custom("DungGeunMo", size: 20))
                    .frame(width: 40)
            }
            .foregroundColor(.black)    // 방 내부 글자색
            .padding()
        }
        .padding(.horizontal, 6)        // 방 양으로 패딩
    }
}

struct TestRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomListView(newRoom: ModelData().rooms[0])
            .environmentObject(ModelData())
    }
}
