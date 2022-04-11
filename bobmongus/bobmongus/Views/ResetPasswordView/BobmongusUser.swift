//
//  BobmongusUser.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/07.
//

import Foundation

struct BobmongusUser: Hashable, Codable, Identifiable {
    var id : Int
    var email: String
    var nickname: String
    var password: String
    var isMakingRoom: Bool
    var isReady: Bool
    var roomnum: Int
}

//class UserLists: ObservableObject {
//    @Published var user_list = [BobmongusUser]()
//    
//}
