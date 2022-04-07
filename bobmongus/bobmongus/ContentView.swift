//
//  ContentView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(users) { user in
                Text("\(user.email)")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
