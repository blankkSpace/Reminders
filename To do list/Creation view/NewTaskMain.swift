//
//  NewTaskMain.swift
//  To do list
//
//  Created by djnewzo on 20/07/2025.
//

import SwiftUI

struct NewTaskMain: View {
    
//    @State private var headingText: String = ""
//    @State private var Notes: String = ""
    @State private var eventDate: Date = Date()
    
    //Save load save functionality
//    @StateObject private var saveData = dataStore()
    @ObservedObject var saveData: dataStore
    
    
    //Calling strucct reminderModel
    @State private var reminderData = reminderModel(title: "", description: nil ,date: Date())
        
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
                Form {
                    //Base information
                    Section {
                        TextField("Enter your heading", text: $reminderData.title, axis: .vertical)
                            .bold(true)
                        
                        //By applying the axis modifer we allow the text field to expand vertically as the field fills itself
                        //Unwrapped applies get and set function to check for null values
                        TextField("Notes",text: $reminderData.description.unwrapped(), axis: .vertical)
                            .lineLimit(6, reservesSpace: true)
                    }
                    
                    //Date seleciton
                    Section {
                        DatePicker("Date", selection: $reminderData.date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                    }
                    
                    //Catagory selection
                    Section{
                        Text("Cool button would totally go here")
                    }
                }
                .navigationTitle("New reminder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            print(URL.documentsDirectory.path)
                            dismiss()
                        }
                        .foregroundStyle(.red)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            print("Saving reminder:", reminderData)
                            saveData.save(reminderData: reminderData)
                            dismiss()
                        }
                        .foregroundStyle(.blue)
                    }
                }
        }
    }
}

//#Preview {
//    NewTaskMain(saveData: dataStore)
//}
