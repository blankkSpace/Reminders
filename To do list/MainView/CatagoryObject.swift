//
//  CatagoryObject.swift
//  To do list
//
//  Created by djnewzo on 20/07/2025.
//

import SwiftUI

struct CatagoryObject: View {
    
    let icon: String
    let title: String
    let count: Int
    
    var body: some View {
        GroupBox {
            HStack {
                VStack(spacing: 10) {
                    Image(systemName: icon)
                    Text(title)
                }
                Spacer()
                Text("\(count)")
                    .font(.largeTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

#Preview {
    CatagoryObject(icon: "calendar", title: "Today", count: 9)
}
