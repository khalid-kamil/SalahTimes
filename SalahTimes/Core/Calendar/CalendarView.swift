//
//  CalendarView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - CalendarView

struct CalendarView: View {
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 0) {
        Text("Hijri date".uppercased())
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)

        Text("Calendar")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
      .padding()

      HStack {
        Spacer()
        Button {
          print("")
        } label: {
          Text("Full Month")
            .fontWeight(.medium)
            .font(.footnote)
        }
      }
      .padding(.horizontal)

      List {
        Section(header: Text("Dhul Hijja")) {
          CalendarDayRowView(weekDay: "Tue", day: "9")
          CalendarDayRowView(weekDay: "Wed", day: "10")
          CalendarDayRowView(weekDay: "Thu", day: "11")
          CalendarDayRowView(weekDay: "Fri", day: "12")
          CalendarDayRowView(weekDay: "Sat", day: "13")
          CalendarDayRowView(weekDay: "Sun", day: "14")
        }

        Section("Muharram") {
          CalendarDayRowView(weekDay: "Tue", day: "1")
          CalendarDayRowView(weekDay: "Wed", day: "2")
          CalendarDayRowView(weekDay: "Thu", day: "3")
          CalendarDayRowView(weekDay: "Fri", day: "4")
          CalendarDayRowView(weekDay: "Sat", day: "5")
          CalendarDayRowView(weekDay: "Sun", day: "6")
        }
      }
    }
    .background(Color(.secondarySystemBackground))
  }
}

// MARK: - Calendar_Previews

struct Calendar_Previews: PreviewProvider {
  static var previews: some View {
    CalendarView()
  }
}
