//
//  ContentView.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var storage = Storage()
    @State private var displayMenu = false
    
    var body: some View {
        NavigationView {
            List {
                if storage.servings.isEmpty {
                    Button("Add your first drink") {
                        displayMenu = true
                    }
                } else {
                    ForEach(storage.servings) { serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                Text(serving.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.caffeine)mg")
                        }
                    }
                }
            }
            .sheet(isPresented: $displayMenu, content: MenuView.init)
            .navigationTitle("Chill Beans")
            .toolbar {
                Button {
                    displayMenu = true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
            .environmentObject(menu)
            .environmentObject(storage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
