//
//  ListInfoView.swift
//  To do list
//
//  Created by djnewzo on 30/07/2025.
//

import SwiftUI

struct ListInfoView: View {
    
    @State private var listTitle: String = ""
    
    @State private var colorOptions : [Color] = [.red, .orange, 
                                                 .yellow,
                                                 .green,
                                                 .mint,
                                                 .teal,
                                                 .blue,
                                                 .indigo,
                                                 .purple,
                                                 .pink,
                                                 .brown,
                                                 .gray
    ]
    
    let symbolOptions: [String] = [
        "star.fill",
        "heart.fill",
        "flame.fill",
        "bolt.fill",
        "moon.fill",
        "cloud.fill",
        "leaf.fill",
        "sun.max.fill",
        "drop.fill",
        "paperplane.fill",
        "cart.fill",
        "bell.fill"
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 44)) // adjust based on your desired circle size + padding
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                sectionCard() {
                    
                    DisplayIconCircle()
                    
                    Spacer()
                    
                    sectionCard(backColor: Color(UIColor.systemGray5) ) {
                        VStack(alignment: .center) {
                            TextField("List name", text: $listTitle)
                                .font(.title)
                                .bold(true)
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
                
                sectionCard() {
                    Text("Pick a color")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(colorOptions, id: \.self){ color in
                            Circle()
                                .fill(color)
                                .frame(width: 45, height: 45)
                                .padding(10)
                        }
                    }
                    .padding(.horizontal)
                }
                
                sectionCard() {
                    Text("Select an icnon")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(symbolOptions, id: \.self) { symbol in
                                Button{
                                    print("Buttton pressed")
                                } label: {
                                    ZStack{
                                        Circle()
                                            .fill(Color.white) // Background color
                                            .frame(width: 40, height: 40)

                                        Image(systemName: symbol)
                                            .foregroundColor(.gray) // Icon color
                                            .font(.system(size: 20))
                                    }
                                    
                                }
//                                Circle()
//                                    .fill(Color.white) // Background color
//                                    .frame(width: 40, height: 40)
//
//                                Image(systemName: symbol)
//                                    .foregroundColor(.gray) // Icon color
//                                    .font(.system(size: 20))
                            
                                
//                            Image(systemName: symbol)
//                                .resizable()
//                                .frame(width: 20, height: 20)
                        }
                        
                    }
                   
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        print(URL.documentsDirectory.path)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
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
