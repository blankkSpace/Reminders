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
    @State private var showingSheet = false
    
    
    @State public var taskArray: [reminderModel] = [
        reminderModel(title: "Test", description: "This is a view", date: .now),
        reminderModel(title: "Test 2", description: "This is a view", date: .now),
        reminderModel(title: "Test 2", description: "This is a view", date: .now),

    ]
    
    
    var body: some View {
        NavigationStack {
            List {
                Text("Search bar")
                VStack{
                    HStack {
                        CatagoryObject(icon: "calendar", title: "Today", count: 10)
                        CatagoryObject(icon: "calendar", title: "Scheduled", count: 10)
                    }
                    HStack {
                        CatagoryObject(icon: "calendar", title: "All", count: 10)
                        CatagoryObject(icon: "calendar", title: "Completed", count: 10)
                    }
                    
                    //Temporary styling to test saving data
//                    HStack {
//                        Button{
//                            showingSheet.toggle()
//                        } label: {
//                            CatagoryObject(icon: "calendar", title: "Task view", count: 10)
//                        }.buttonStyle(PlainButtonStyle())
//                            .sheet(isPresented: $showingSheet) {
//                            }
//                        
//                        Button{
//                            print("Womp")
//                        } label: {
//                            CatagoryObject(icon: "calendar", title: "Completed", count: 10)
//                        }.buttonStyle(PlainButtonStyle())
//                       
//                    }
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

                
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("New reminder" ,systemImage:"plus.circle.fill") {
                        showingSheet.toggle()
                        
                    }
                    .sheet(isPresented: $showingSheet) {
                        NewTaskMain()
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
