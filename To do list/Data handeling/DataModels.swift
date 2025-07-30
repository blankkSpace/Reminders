//
//  ReminderModel.swift
//  To do list
//
//  Created by djnewzo on 27/07/2025.
//

import Foundation
import SwiftUI

struct reminderModel: Identifiable, Codable{
    var id = UUID().uuidString
    var title: String
    var description: String? //Allows for item to be empty
    var date: Date
}

//Hanldes when a optional string is sent a empty result ensuring an empty string when the elements are updated
extension Binding where Value == String? {
    func unwrapped(defaultValue: String = "") -> Binding<String> {
        Binding<String>(
            get: {
                //Gets the value of wrapped OR gets the default value is empty 
                self.wrappedValue ?? defaultValue
            },
            set: { newValue in
                // value is empty return null otherwise set the new value
                if newValue.isEmpty {
                    self.wrappedValue = nil
                } else {
                    self.wrappedValue = newValue
                }
            }
        )
    }
}

struct listModel: Identifiable {
    let id: UUID
    let name: String
    let symbol: String
    let color: String // Consider playing about with using color to see how it differs
}

