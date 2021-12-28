//
//  Config.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import Foundation

struct Config: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = Config(id: UUID(), name: "None", calories: 0)
}
