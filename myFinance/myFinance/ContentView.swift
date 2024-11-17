//
//  ContentView.swift
//  myFinance
//
//  Created by Dhan Moti on 16/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ExpensePatterns()
                .tabItem {
                    Label("Behaviour", systemImage: "scale.3d")
                }
            History()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
