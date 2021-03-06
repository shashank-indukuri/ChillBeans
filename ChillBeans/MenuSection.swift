//
//  MenuSection.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
    
    func filters(for searchText: String) -> [Drink] {
        let trimmedString = searchText.trimmingCharacters(in: .whitespaces)
        
        if trimmedString.isEmpty {
            return drinks
        }
        
        return drinks.filter {
            $0.name.localizedCaseInsensitiveContains(trimmedString)
        }
    }
}
