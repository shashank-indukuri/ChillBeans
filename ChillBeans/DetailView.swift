//
//  DetailView.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import SwiftUI

struct DetailView: View {
    let drink: Drink
    @State private var index = 0
    @State private var isDecaffe = false
    
    let sizeOptions = ["Short", "Tall", "Grande"]
    
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
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
                Toggle("Dacaffeinated", isOn: $isDecaffe)
            }
            Section("Estimates") {
                Text("**Caffeine**: \(caffeine) mg")
                Text("**Calories**: \(calories)")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(drink: Drink.example)
    }
}
