//
//  ContentView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            Today()
                .tabItem {
                    Label("Today", systemImage: "square.stack.3d.up.fill")
                }
            Calendar()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}