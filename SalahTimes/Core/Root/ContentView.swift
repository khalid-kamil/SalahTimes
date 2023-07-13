//
//  ContentView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {

  var body: some View {
    TabView {
      TodayView()
        .tabItem {
          Label("Today", systemImage: "square.stack.3d.up.fill")
        }
      CalendarView()
        .tabItem {
          Label("Calendar", systemImage: "calendar")
        }
    }
  }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
