//
//  DataModel.swift
//  TodoList+URLsession
//
//  Created by t2023-m0056 on 2023/08/23.
//

import Foundation

struct TodoData: Codable {
    var title: String
    var category: String
    var isCompleted: Bool
    var id: String
    
    init(title: String, category: String, isCompleted: Bool, id: String) {
        self.title = title
        self.category = category
        self.isCompleted = isCompleted
        self.id = id
    }
}

class DataManager {
    static let dataManager = DataManager()
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    var dataList = [TodoData]()
    
    init() {
        dataList = loadUserDefaults()
    }
    
    func saveUserDefaults() {
        if let encoded = try? encoder.encode(dataList) {
            print("type: \(type(of: encoded))")
            UserDefaults.standard.set(encoded, forKey: "Todo")
        }
    }
    
    func loadUserDefaults() -> [TodoData] {
        if let data = UserDefaults.standard.object(forKey: "Todo") as? Data,
           let todo = try? decoder.decode([TodoData].self, from: data) {
            if todo.isEmpty {
                return self.dataList
            }
            return todo
        }
        return [TodoData(title: "ios 공부하기", category: "ios", isCompleted: false, id: UUID().uuidString)]
    }
    
    func completeTodo(_ id: String) {
        print(id)
        for i in 0...dataList.count-1 {
            if (dataList[i].id == id) {
                dataList[i].isCompleted = !dataList[i].isCompleted
            }
        }
        saveUserDefaults()
    }
    
    func createTodo(_ data: TodoData) {
        self.dataList.append(data)
        saveUserDefaults()
    }
}
