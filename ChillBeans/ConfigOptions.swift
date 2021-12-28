//
//  ConfigOptions.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/28/21.
//

import Foundation

struct ConfigOptions: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigOptions(id: UUID(), name: "None", calories: 0)
}
