//
//  ImageDemoView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/11.
//

import SwiftUI

import Combine
//시간 경과에 따른 값 처리를 위한 선언전 swift api

class Users: ObservableObject {
    @Published var images = "mong3"
}

struct ImageDemoView: View {
    @State var showModal = false
//    @State var userImage = "mong1"

    @ObservedObject var users = Users()
    @State var userImage = "mong3"
    
    var body: some View {
        ZStack{
            VStack{
                Button(action: { self.userImage = "mong2"}) {
                    Image(userImage)
                }

        Button("프로필 사진 변경") {
            showModal = true
        }
        .font(.custom("DungGeunMo", size: 15))
        .frame(width: 135.0, height: 50.0)
        .background(Color(red: 0.471, green: 0.222, blue: 0.542))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.vertical)
            }
        ZStack{
            if showModal {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.6))
                    .edgesIgnoringSafeArea(.all)
                //모달창 배경
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .padding(.horizontal)
                        .frame(width: 390.0, height: 330.0)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
//                        .overlay(ModalContentView(showModal: self.$showModal))
                    
                }
                .transition(.move(edge: .bottom))
            }
        }

        }
    }

struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var userImage: String

    var body: some View {
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
                        .font(.custom("DungGeunMo", size: 17))
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)

            VStack{
                HStack(alignment: .center){
                    Spacer()

                    Button(action: {
                        self.userImage = "mong1"
                    }){
                        Image("mong1")
                    }

                    Spacer()
                    Button(action: {
                        self.userImage = "mong2"
                    }){
                        Image("mong2")
                    }

                    Spacer()
                    Image("mong3")
                    Spacer()
                }
                .padding(.top)
                HStack{
                    Spacer()
                    Image("mong4")
                    Spacer()
                    Image("mong5")
                    Spacer()
                    Image("mong6")
                    Spacer()
                }
                .padding(.bottom)

            }

            VStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        //self.showModal.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .imageScale(.large)
                        Text("프로필 사진 변경")
                            .fontWeight(.bold)
                            .font(.custom("DungGeunMo", size: 17))

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

struct ImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemoView()
    }
}

}
