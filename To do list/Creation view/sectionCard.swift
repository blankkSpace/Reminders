//
//  sectionCard.swift
//  To do list
//
//  Created by djnewzo on 30/07/2025.
//

import SwiftUI

struct sectionCard<Content: View>: View {
    

    //TO DO
    /// Make it possible to specify the color of the section card
    ///
    
    var backColor: Color
    let content: Content

    init(backColor: Color = Color.white , @ViewBuilder content: () -> Content) {
        self.backColor = backColor
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
                   content
               }
               .padding() //Internal padding of the card
               .frame(maxWidth: .infinity)
        //Creats a rectangle as the background for the view
               .background(
                   RoundedRectangle(cornerRadius: 16)
                    .fill(backColor)
               )
               .padding(.horizontal, 16)
               .padding(.vertical, 8)
    }
}


