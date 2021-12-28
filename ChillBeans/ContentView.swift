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
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
            .environmentObject(storage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
