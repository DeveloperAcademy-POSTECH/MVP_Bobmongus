//
//  RoomPageView.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/06.
//

import SwiftUI

struct RoomPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isClick: Bool = false
    
    var backBtn: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("< 나가기")
            
        }
    }
    
    //MARK: Temporary Values
    var description: String = "포항공대 근처에서 아주 유명한 맛집인 xxxx에서 주문하려합니다!! 배달요금은 4000원이고, C5건물앞에 모여서 수령하면 좋을 것 같아요!! 모두 레디하시면 오카방 링크가 뜬다고하니 들어와주시면 감사하겠습니다!! ㅎㅎ"
    
    var openLink: String = "https://blabla.com"
    
    var body: some View {
        VStack {
            Button {
                self.isClick.toggle()
            } label: {
                isClick ? Text(description) :
                Text("상세설명")
                    .foregroundColor(.purple)
            }
            
            Text(openLink)
                .font(.body)
//                .hidden() //Display when allready
            
        }
        .navigationTitle("title") //추후
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                backBtn
            }
        }
    }
}

struct RoomPageView_Previews: PreviewProvider {
    static var previews: some View {
        RoomPageView()
    }
}
