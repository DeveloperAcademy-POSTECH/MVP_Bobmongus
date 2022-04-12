//
//  DummyUser.swift
//  LoginTest
//
//  Created by Chicken on 2022/04/10.
//

import Foundation

struct DummyUser: Codable {
    var nickname: String
    var email: String
    var password: String
    
    init(nickname: String, email: String, password: String) {
        self.nickname = nickname
        self.email = email
        self.password = password
    }
}
