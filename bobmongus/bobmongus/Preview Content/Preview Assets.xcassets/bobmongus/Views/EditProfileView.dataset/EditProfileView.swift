//
//  EditPasswordView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/06.
//

import SwiftUI

struct EditPasswordView: View {
    var body: some View {
        NavigationView{
        VStack {
            VStack{
                Text("프로필 변경")
                    .font(.largeTitle)
            }
            
            VStack{
                Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)
                Text("Nickname")
            }
            .padding(.vertical)
            
            VStack{
                Button("프로필 사진 변경") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: 135.0, height: 50.0)
                .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                .foregroundColor(.white)
                .cornerRadius(10)
                
                
                
                Button("닉네임 변경") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: 135.0, height: 50.0)
                .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.top)
            }
        }
    }
}

struct EditPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EditPasswordView()
    }
}
