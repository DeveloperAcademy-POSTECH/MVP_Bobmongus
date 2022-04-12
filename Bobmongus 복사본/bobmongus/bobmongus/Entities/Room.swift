//
//  Room.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/10.
//

import SwiftUI

struct Room: Decodable, Identifiable {
    var id: Int
    var isStart: Bool
    var roomTitle: String
    var roomDetail: String
    var nowPersons: [User]
    var persons: Int
    var endTime: Int
    var linkURL: String
    var roomTimeStr: String
    
    struct User: Decodable, Identifiable {
        var id: Int
        var icon: String
        var isReady: Bool
        var isMakingRoom: Bool
        var nickName: String
        var userAddress: String
    }
}
