//
//  ModelData.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/10.
//

import SwiftUI
import Combine

final class ModelData: ObservableObject {
    

    @Published var rooms: [Room] = testRooms.sorted {
        $0.endTime > $1.endTime
    }
    
    @Published var myProfile: Room.User = Room.User(id: 6, icon: "usmong", isReady: false, isMakingRoom: false, nickName: "Tamna", userAddress: "*포스빌 6동*")
    
}

var testRooms: [Room] = loadJson("dummyrooms.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
