//
//  ListInfoView.swift
//  To do list
//
//  Created by djnewzo on 30/07/2025.
//

import SwiftUI

struct ListInfoView: View {
    
    @State private var listTitle: String = ""
    
    @State private var colorOptions : [Color] =
    [ .red, .orange, .yellow, .green, .mint, .teal, .blue, .indigo, .purple, .pink ]
    
    let symbolOptions: [String] = [
        "list.bullet",                // No fill variant
            "briefcase.fill",
            "house.fill",
            "cart.fill",
            "creditcard.fill",
            "airplane",                   // No fill variant
            "heart.fill",
            "book.fill",
            "graduationcap.fill",
            "pencil.circle.fill",         // Closest filled variant
            "car.fill",
            "wrench.fill",
            "leaf.fill",
            "gift.fill",
            "star.fill",
            "bolt.fill",
            "lightbulb.fill",
            "globe",                      // No fill variant
            "pawprint.fill",
            "music.note",                 // No fill variant
            "gamecontroller.fill",
            "moon.fill",
            "sun.max.fill",
            "clock.fill",
            "calendar",                   // No fill variant
            "person.2.fill",
            "phone.fill",
            "envelope.fill",
            "bell.fill",
            "doc.text.fill",
            "checkmark.circle.fill",
            "bookmark.fill",
            "camera.fill",
            "film.fill",
            "tray.fill",
            "cube.box.fill",
            "hammer.fill",
            "scissors",                   // No fill variant
            "bed.double.fill",
            "figure.walk.circle.fill"
    ]
    
    //Selected values
    @State private var selectedSymbol: String = "star.fill"
    @State private var selectedColor: Color = .red
    
    let columns = [
        GridItem(.adaptive(minimum: 44), spacing: 15) // adjust based on your desired circle size + padding
    ]
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                
                // Icon and list name
                sectionCard(backColor: Color(UIColor.secondarySystemGroupedBackground)) {
                    
                    DisplayIconCircle(selectedIcon: selectedSymbol, selectedColor: selectedColor)
                    
                    sectionCard(backColor: Color(UIColor.systemGray5) ) {
                        VStack(alignment: .center) {
                            TextField("List name", text: $listTitle)
                                .font(.title)
                                .foregroundStyle(selectedColor)
                                .bold(true)
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
                
                
                //Color selection
                sectionCard(backColor: Color(UIColor.secondarySystemGroupedBackground)) {
                    Text("Pick a color")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(colorOptions, id: \.self){ color in
                            
                            Button{
                                selectedColor = color
                            } label: {
                                Circle()
                                    .fill(color)
                                    .frame(width: 45, height: 45)
                                    .padding(10)
                                    .overlay(
                                        Circle()
                                        //3 : 0 acts as tenerary (Yes or no) operator and sets the width based on if the selected symbol matches the current button
                                            .stroke(Color.primary.opacity(0.30), lineWidth: selectedColor == color ? 4 : 0)
                                            .scaleEffect(0.85)
                                            .animation(.easeInOut, value: selectedSymbol)
                                    )
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }
                
                //Icon selection
                sectionCard(backColor: Color(UIColor.secondarySystemGroupedBackground)) {
                    Text("Select an icnon")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(symbolOptions, id: \.self) { symbol in
                                Button{
                                    selectedSymbol = symbol
                                } label: {
                                    ZStack{
                                        Image(systemName: symbol)
                                            .foregroundColor(Color.primary.opacity(0.60)) // Symbol color
                                            .font(.system(size: 24))
                                            .frame(width: 50, height: 50)
                                            .background(
                                                Circle()
                                                    .fill(Color.primary.opacity(0.10)) // Background circle
                                            )
                                            .overlay(
                                                Circle()
                                                //3 : 0 acts as tenerary (Yes or no) operator and sets the width based on if the selected symbol matches the current button
                                                    .stroke(Color.primary.opacity(0.30), lineWidth: selectedSymbol == symbol ? 3 : 0)
                                                    .scaleEffect(1.2)
                                                    .animation(.easeInOut, value: selectedSymbol)
                                            )
                                    }
                                    
                                }
                        }
                        
                    }
                   
                }
                
            }
            .navigationTitle(Text("Add List"))
            .navigationBarTitleDisplayMode(.inline)
            .background(
                Color(UIColor.systemGroupedBackground)
                    .overlay(
                        colorScheme == .dark
                        ? Color.white.opacity(0.08) // Just a slight brighten
                        : Color.clear
                    )
                    .ignoresSafeArea(.all)
            ) // Only scroll content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        print(URL.documentsDirectory.path)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("Saving reminder:")
                    }
                }
            }
            
        }
    }
}

#Preview {
    ListInfoView()
}
