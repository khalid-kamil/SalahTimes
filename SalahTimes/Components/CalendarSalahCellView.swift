//
//  CalendarSalahCellView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

// MARK: - CalendarSalahCellView

struct CalendarSalahCellView: View {

  // MARK: Lifecycle

  init(salahName: String, salahTime: String, iqamaTime: String? = nil) {
    self.salahName = salahName
    self.salahTime = salahTime
    self.iqamaTime = iqamaTime
  }

  // MARK: Internal

  let salahName: String
  let salahTime: String
  let iqamaTime: String?

  var body: some View {
    HStack {
      VStack {
        Text(salahName.uppercased())
          .fontWeight(.semibold)
          .font(.caption2)
          .foregroundColor(.secondary)

        Text(salahTime)
      }

      VStack {
        if let iqama = iqamaTime {
          Text("Iqama".uppercased())
            .fontWeight(.semibold)
            .font(.caption2)
            .foregroundColor(.secondary)

          Text(iqama)
        }
      }
    }
    .padding(.trailing)
  }
}

// MARK: - CalendarSalahCell_Previews

struct CalendarSalahCell_Previews: PreviewProvider {
  static var previews: some View {
    CalendarSalahCellView(salahName: "Fajr", salahTime: "02:49", iqamaTime: "03:09")
      .previewDisplayName("Calendar Salah Cell")
      .previewLayout(.sizeThatFits)
      .background(Color(.secondarySystemBackground))
      .padding()
  }
}
