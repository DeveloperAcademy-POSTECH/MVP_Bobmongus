//
//  ContentView.swift
//  bobmongus
//
//  Created by ryu hyunsun on 2022/04/06.
//
import Foundation
import SwiftUI

struct ContentView: View {
//    @StateObject var dataManager = DataManager()
    @State private var userName: String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
//
//            ForEach(dataManager.jsonArray) { jsonValue in
//                Text("Username is \(jsonValue.username)")
//            }
//
//            TextField("Username", text: $userName)
//
//            Button(action: {
//                // Update array, just for testing update all userName
//                for i in dataManager.jsonArray.indices {
//                    dataManager.jsonArray[i].username = userName
//                }
//                // save to file
//                dataManager.saveToFile()
//                print("Done")
//            })
//            {
//                Text("Save")
//            }
        }.frame(width: 444, height: 444)
    }
    
}

//class DataManager: ObservableObject {
//    @Published var jsonArray: [JsonModel] = []
//
//    var fileName = "settingsData"
//
//    init() {
//        readFromFile()
//    }
//
//    func readFromFile() {
//        jsonArray = readJSONBundle(fileName) // do this only the first time you open the app
//      //  readJSON() // read from the saved file
//    }
//
//    private func readJSONBundle<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//        do {
//            print(file)
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//        do {
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode(T.self, from: data)
//            return jsonData
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//
//    func saveToFile() {
//        do {
//            let furl = try FileManager.default
//                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent(fileName)
//                .appendingPathExtension("json")
//            print("---> writing to: \(furl)")
//            let data = try JSONEncoder().encode(jsonArray)
//            try data.write(to: furl)
//        } catch {
//            print("---> error saveToFile: \(error)")
//        }
//    }
//
//    func readJSON() {
//        do {
//            let furl = try FileManager.default
//                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent(fileName)
//                .appendingPathExtension("json")
//            print("---> reading from: \(furl)")
//            let data = try Data(contentsOf: furl)
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode([JsonModel].self, from: data)
//            jsonArray = jsonData
//        } catch {
//            print("---> error reading from file: \(error)")
//        }
//    }
//
//}
//
//struct JsonModel: Hashable, Codable, Identifiable {
//    var id: Int
//    var username: String
//    var password: String
//}
