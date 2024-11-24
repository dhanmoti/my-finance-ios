//
//  HomeView.swift
//  myFinance
//
//  Created by Dhan Moti on 16/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("myFinance")
            List {
                Text("Home is my Dashboard")
                VStack {
                    Text("High level summary")
                }
                
                VStack {
                     Text("Debit")
                 }
                VStack {
                     Text("Credit")
                 }
                
             }
             .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
