//
//  Drink.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    static let example = Drink(id: UUID(), name: "Drink")
}
