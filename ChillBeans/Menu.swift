//
//  Menu.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import Foundation

class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    var milkOptions = [ConfigOptions.none]
    var syrupOptions = [ConfigOptions.none]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menu = try JSONDecoder().decode(Menu.self, from: data)
            sections = menu.sections
            milkOptions = menu.milkOptions
            syrupOptions = menu.syrupOptions
        } catch {
            fatalError("Menu couldn't load. Please try again...")
        }
    }
}
