//
//  ServingDrink.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/28/21.
//

import Foundation

struct ServingDrink: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
