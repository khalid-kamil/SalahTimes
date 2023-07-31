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
          Label("Today's Times", systemImage: "clock")
        }
      CalendarView()
        .tabItem {
          Label("Calendar", systemImage: "calendar")
        }
      MosqueInformationView(mosqueName: "JJME")
        .tabItem {
          Label("My Mosque", systemImage: "doc.text.image")
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
