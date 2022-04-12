//
//  MypageView.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/06.
//

import SwiftUI

struct MypageView: View {
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            
        VStack {
            Text("My Page")
                .padding(.bottom)
                .font(.largeTitle)
            
            VStack {
                
                VStack {
                        Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)

                        Text("bobmongus@bob.com")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    
                        Text("Nickname")
                        .fontWeight(.medium)
                        .padding(.bottom)
                }
                
                VStack {
                    NavigationLink(destination: EditProfileView()){
                        Button(/*@START_MENU_TOKEN@*/"프로필 변경"/*@END_MENU_TOKEN@*/){
                        }
                    }
                    .padding(.vertical)
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button(/*@START_MENU_TOKEN@*/"비밀번호 변경"/*@END_MENU_TOKEN@*/) {
                    }
                    .padding(.vertical)
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.471, green: 0.222, blue: 0.542))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.vertical)
                
                VStack {
                    Button("탈퇴") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding(.vertical)
                    .frame(width: 135.0, height: 50.0)
                    .background(Color(red: 0.957, green: 0.957, blue: 0.965))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                }
            }
        }
    
        }
    }
struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
}
