//
//  dataStorage.swift
//  To do list
//
//  Created by djnewzo on 28/07/2025.
//

import Foundation

class dataStore: ObservableObject {
    
    init(){
        loadReminders()
    }
    
    private var reminderData = reminderModel(title: "", description: nil ,date: Date())
    
//    @Published var reminderData: [reminderModel] = []
    let jsonPath = URL.documentsDirectory.appendingPathComponent("reminders.json")
    
    //Checks if the file orignally exisits and appends to the file if it does
    //else it will simple create and add to it
    func save() {
        do{
            var existingReminders: [reminderModel] = []
            if(FileManager.default.fileExists(atPath: jsonPath.path)){
                let data = try Data(contentsOf: jsonPath)
                existingReminders = try JSONDecoder().decode([reminderModel].self, from: data)
            }
            existingReminders.append(reminderData)
            let updateData = try JSONEncoder().encode(existingReminders)
            try updateData.write(to: jsonPath)
//            let jsonURL = URL.documentsDirectory.appendingPathComponent("remi")
//            let parentData = try JSONEncoder().encode([reminderData])
//            try parentData.write(to: jsonURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadReminders(){
        
    }

    
}
