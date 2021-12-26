//
//  Section.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import Foundation

struct Section: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
}
