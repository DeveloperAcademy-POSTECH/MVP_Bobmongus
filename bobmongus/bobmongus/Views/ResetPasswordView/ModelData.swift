//
//  ModelData.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/07.
//

import Foundation

var users: [BobmongusUser] = load("userData.json")
//var users = loadJsonFile()

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


// json 데이터를 읽고 쓰기 위한 데이터 매니져 클래스
class DataManager: ObservableObject {
    @Published var jsonArray: [BobmongusUser] = []

    var fileName = "userData"

    init() {
        readFromFile()
    }

    func readFromFile() {
        jsonArray = readJSONBundle(fileName) // do this only the first time you open the app
      //  readJSON() // read from the saved file
    }

    private func readJSONBundle<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            print(file)
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

    func saveToFile() {
        do {
            let furl = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(fileName)
                .appendingPathExtension("json")
            print("---> writing to: \(furl)")
            let data = try JSONEncoder().encode(jsonArray)
            try data.write(to: furl)
        } catch {
            print("---> error saveToFile: \(error)")
        }
    }

    func readJSON() {
        do {
            let furl = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(fileName)
                .appendingPathExtension("json")
            print("---> reading from: \(furl)")
            let data = try Data(contentsOf: furl)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([BobmongusUser].self, from: data)
            jsonArray = jsonData
        } catch {
            print("---> error reading from file: \(error)")
        }
    }

}
