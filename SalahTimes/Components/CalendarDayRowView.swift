//
//  CalendarDayRowView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

// MARK: - CalendarDayRowView

struct CalendarDayRowView: View {
  let weekDay: String
  let day: String

  var body: some View {
    HStack {
      VStack {
        Text(weekDay.uppercased())
          .fontWeight(.semibold)
          .font(.caption2)
          .foregroundColor(.accentColor)

        Text(day)
          .font(.title3)
          .fontWeight(.light)
      }
      .padding(.vertical, 2)
      .padding(.trailing)

      ScrollView(.horizontal) {
        HStack {
          CalendarSalahCellView(salahName: "Fajr", salahTime: "02:49", iqamaTime: "03:09")
          CalendarSalahCellView(salahName: "Sunrise", salahTime: "04:45")
          CalendarSalahCellView(salahName: "Dhuhr", salahTime: "13:09", iqamaTime: "13:30")
          CalendarSalahCellView(salahName: "Asr", salahTime: "17:27", iqamaTime: "18:00")
          CalendarSalahCellView(salahName: "Maghrib", salahTime: "21:24", iqamaTime: "21:24")
          CalendarSalahCellView(salahName: "Isha", salahTime: "22:36", iqamaTime: "22:45")
        }
      }
    }
  }
}

// MARK: - CalendarDayRow_Previews

struct CalendarDayRow_Previews: PreviewProvider {
  static var previews: some View {
    CalendarDayRowView(weekDay: "Tue", day: "9")
      .previewDisplayName("Calendar Day Row")
      .previewLayout(.sizeThatFits)
      .background(Color(.secondarySystemBackground))
      .padding()
  }
}
