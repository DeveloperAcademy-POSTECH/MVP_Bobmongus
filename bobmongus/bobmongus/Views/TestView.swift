//
//  TestView.swift
//  bobmongus
//
//  Created by Chicken on 2022/04/12.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var user: User
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(user: User())
    }
}
