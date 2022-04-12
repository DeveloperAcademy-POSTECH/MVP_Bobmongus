//
//  RoomlistButtonView.swift
//  bobmongus
//
//  Created by baek seohyeon on 2022/04/12.
//

import SwiftUI

struct RoomlistButtonView: View {
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
//방만들기 버튼
            ZStack {
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
        }
        //한 번에 하나의 상위 뷰만 표시하는 뷰 스택으로 표시되는 탐색 뷰 스타일
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RoomlistButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoomlistButtonView()
    }
}
