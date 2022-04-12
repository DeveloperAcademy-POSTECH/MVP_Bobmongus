//
//  NaviTestView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/07.
//

import SwiftUI

struct NaviTestView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            NavigationLink(destination: EditPasswordView().navigationBarHidden(true)) {
                Text("프로필 변경")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 135, height: 50)
                    
            }
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(Color(red: 0.471, green: 0.222, blue: 0.546))
        }
        
//        Button(action: {
//            self.showingAlert = true
//        }) {
//            Text("탈퇴")
//                .font(.caption2)
//                .fontWeight(.bold)
//                .frame(width: 60, height: 30)
//                .foregroundColor(.white)
//        }
//        .background(RoundedRectangle(cornerRadius: 10))
//        .foregroundColor(Color(red: 0.534, green: 0.189, blue: 0.488))
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("확인"), message: Text("해당 닉네임은 사용 가능합니다."), dismissButton: .default(Text("닫기")))
//        }
        Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Show Alert")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
                }
    }
}

struct NaviTestView_Previews: PreviewProvider {
    static var previews: some View {
        NaviTestView()
    }
}
