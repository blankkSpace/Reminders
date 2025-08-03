//
//  DisplayIconCircle.swift
//  To do list
//
//  Created by djnewzo on 30/07/2025.
//

import SwiftUI

struct DisplayIconCircle: View {
    
    var selectedIcon: String
    var selectedColor: Color
    
    init(selectedIcon: String, selectedColor: Color) {
        self.selectedIcon = selectedIcon
        self.selectedColor = selectedColor
    }
    
    
    var body: some View {
        
//        VStack(alignment: .center, spacing: 12) {
//            
//            Image(systemName: selectedIcon)
//                .font(.system(size: 52, weight: .bold))
//                .foregroundColor(Color(.white))
//                
//               }
//               .padding() //Internal padding of the card
//               .frame(maxWidth: .infinity)
//        //Creats a rectangle as the background for the view
//               .background(
//                   Circle()
//                       .fill(Color(.red))
//                       .shadow(color: Color.red.opacity(1), radius: 10)
//               )
//               .padding(.horizontal, 20)
        VStack(spacing: 12) {
                   ZStack {
                       Circle()
                           .fill(selectedColor)
                           .frame(width: 100, height: 100)
                           .shadow(color: selectedColor.opacity(0.7), radius: 10)
                       
                       Image(systemName: selectedIcon)
                           .font(.system(size: 52, weight: .bold))
                           .foregroundColor(.white)
                   }
               }
               .frame(maxWidth: .infinity)
               .padding(.horizontal, 20)
    }
}

//#Preview {
//    DisplayIconCircle(selectedIcon: "plus")
//}
