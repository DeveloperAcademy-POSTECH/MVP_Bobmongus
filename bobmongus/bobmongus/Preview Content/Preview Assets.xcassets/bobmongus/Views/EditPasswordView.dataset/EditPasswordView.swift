//
//  EditProfileView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/06.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationView{
        VStack {
            VStack {
                Text("비밀번호 변경").font(.largeTitle)
            }
            
            VStack {
                    HStack {
                        Text("기존 비밀번호 확인")
                        TextField("기존 비밀번호를 입력해주세요", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button("비밀번호 확인") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding(.vertical)
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20.0)
                
            VStack {
                    HStack {
                        Text(/*@START_MENU_TOKEN@*/"새 비밀번호"/*@END_MENU_TOKEN@*/)
                        TextField("새 비밀번호를 입력해주세요", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Text("새 비밀번호 확인")
                        TextField("함만 더 입력해주", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                    Button("비밀번호 변경") {
                        
                    }
                    .padding(.vertical)
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
}
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
