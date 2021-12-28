//
//  DetailView.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import SwiftUI

struct DetailView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var storage: Storage
    @State private var index = 0
    @State private var isDecaffe = false
    @State private var extraShots = 0
    @State private var milk = ConfigOptions.none
    @State private var syrup = ConfigOptions.none
    
    
    let sizeOptions = ["Short", "Tall", "Grande"]
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[index]
        caffeineAmount += (extraShots * 60)

        if isDecaffe {
            caffeineAmount /= 20
        }

        return caffeineAmount
    }

    var calories: Int {
        var calorieAmount = drink.baseCalories
        calorieAmount += extraShots * 10

        if drink.coffeeBased {
            calorieAmount += milk.calories
        } else {
            calorieAmount += milk.calories / 8
        }

        calorieAmount += syrup.calories
        return calorieAmount * (index + 1)
    }
    
    var body: some View {
        Form {
            Section("Basic Options") {
                Picker("Choose a Size", selection: $index) {
                    ForEach(sizeOptions.indices) { size in
                        Text(sizeOptions[size])
                    }
                }
                .pickerStyle(.segmented)
                
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                
                Toggle("Dacaffeinated", isOn: $isDecaffe)
            }
            
            Section("Customizations") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }

                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }
            
            Section("Estimates") {
                Text("**Caffeine**: \(caffeine) mg")
                Text("**Calories**: \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
        .toolbar {
            Button("Save") {
                storage.add(drink: drink, size: sizeOptions[index], extraShots: extraShots, isDecaffe: isDecaffe, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(drink: Drink.example)
    }
}
