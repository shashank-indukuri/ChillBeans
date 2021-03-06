//
//  Storage.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/28/21.
//

import Foundation

class Storage: ObservableObject {
    @Published var servings: [ServingDrink]
    let savePath = FileManager.documentsDirectory.appendingPathComponent("StoredDrinks")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            servings = try JSONDecoder().decode([ServingDrink].self, from: data)
            
        } catch {
            servings = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(servings)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func add(drink: Drink, size: String, extraShots: Int, isDecaffe: Bool, milk: ConfigOptions, syrup: ConfigOptions, caffeine: Int, calories: Int) {
        var descriptionString = [String]()
        descriptionString.append(size)
        
        if isDecaffe {
            descriptionString.append("decaffeinated")
        }
        
        switch extraShots {
        case 0:
            break
        case 1:
            descriptionString.append("1 extra shot")
        default:
            descriptionString.append("\(extraShots) extra shots")
        }
        
        if milk != .none {
            descriptionString.append("\(milk.name.lowercased()) milk")
        }
        
        if syrup != .none {
            descriptionString.append("\(syrup.name.lowercased()) milk")
        }
        
        let description = descriptionString.joined(separator: ", ")
        
        let serving = ServingDrink(id: UUID(), name: drink.name, description: description, caffeine: caffeine, calories: calories)
        servings.insert(serving, at: 0)
        save()
    }
    
    func reorder(serving: ServingDrink) {
        var copy = serving
        copy.id = UUID()
        servings.insert(copy, at: 0)
        save()
    }
    
    func delete(serving: ServingDrink) {
        if let index = servings.firstIndex(of: serving) {
            servings.remove(at: index)
            save()
        }
    }
}
