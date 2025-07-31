//
//  DisplayIconCircle.swift
//  To do list
//
//  Created by djnewzo on 30/07/2025.
//

import SwiftUI

struct DisplayIconCircle: View {
    
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 12) {
            
            Image(systemName: "list.bullet")
                .font(.system(size: 52, weight: .bold))
                .foregroundColor(Color(.white))
                
               }
               .padding() //Internal padding of the card
               .frame(maxWidth: .infinity)
        //Creats a rectangle as the background for the view
               .background(
                   Circle()
                       .fill(Color(.red))
                       .shadow(color: Color.red.opacity(1), radius: 10)
               )
               .padding(.horizontal, 20)
    }
}

#Preview {
    DisplayIconCircle()
}
