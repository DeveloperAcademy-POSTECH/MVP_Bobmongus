//
//  UserCell.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/06.
//

import SwiftUI

struct UserCell: View {
    
    var body: some View {
        VStack {
            Text("익명1")
                .offset(x: 0, y: 20)
            Text("포스빌 6동")
                .offset(x: 0, y: 20)
            Image("bob")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text("READY!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(
                    .red
                )
                .offset(x: 0, y: -20)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
