//
//  ContentView.swift
//  To do list
//
//  Created by djnewzo on 19/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var headingText: String = ""
    @State private var Notes: String = ""
    @State private var eventDate: Date = Date()

    @StateObject private var loader = dataStore()
    
    @State private var searchText: String = ""

    // Load reminders on appear
  
    
    @State public var taskArray: [reminderModel] = [
        reminderModel(title: "Test", description: "This is a view", date: .now),
        reminderModel(title: "Test 2", description: "This is a view", date: .now),
        reminderModel(title: "Test 2", description: "This is a view", date: .now),

    ]
        
    
    //Temporary view handeling
    @State private var showingSheet = false
    @State private var showingReminderList = false
    
    var body: some View {
        NavigationStack {
            List {
                VStack{
                    HStack {
                        CatagoryObject(icon: "calendar", title: "Today", count: 10)
                        CatagoryObject(icon: "calendar", title: "Scheduled", count: 10)
                    }
                    HStack {
                        CatagoryObject(icon: "calendar", title: "All", count: 10)
                        CatagoryObject(icon: "calendar", title: "Completed", count: 10)
                    }

                }
                
                
                Spacer()
                
                
                Section(header: Text("My lists")) {
                    Button("Section 1", systemImage:"plus.circle.fill") {
                        
                    }
                    Button("Section 2", systemImage:"plus.circle.fill") {
                        
                    }
                    Button("Section 3", systemImage:"plus.circle.fill") {
                        
                    }
                    
                }
                
                Section(header: Text("Reminders")) {
                    ForEach(loader.loadedReminders) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.black)

                            Text(item.description ?? "No description")
                                .font(.subheadline)
                                .foregroundColor(.black)

                            Text(item.date.formatted())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                Button("New list" ,systemImage:"plus.circle.fill") {
                    showingReminderList.toggle()
                    
                }
                    .sheet(isPresented: $showingReminderList) {
                        ListInfoView()
                    }

                
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("New reminder" ,systemImage:"plus.circle.fill") {
                        showingSheet.toggle()
                        
                    }
//                    .sheet(isPresented: $showingSheet) {
//                        NewTaskMain()
//                    }
                    .sheet(isPresented: $showingSheet, onDismiss: {
                        loader.loadReminders()
                    }) {
                        NewTaskMain(saveData: loader)
                    }
                    
                }
                //Adding the systam image forces the add to list command out of the bar
                //This is due to how toolbar items are placed
                
                }
            }
        }
}

#Preview {
    ContentView()
}
