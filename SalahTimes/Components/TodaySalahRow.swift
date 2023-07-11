//
//  TodaySalahRow.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

// MARK: - TodaySalahRow

struct TodaySalahRow: View {
  let salah: String
  let salahTime: String
  let isNextSalah: Bool

  init(salah: String, salahTime: String, isNextSalah: Bool = false) {
    self.salah = salah
    self.salahTime = salahTime
    self.isNextSalah = isNextSalah
  }

  var body: some View {
    HStack {
      Text(salah)
      Spacer()
      Text(salahTime)
    }
    .foregroundColor(isNextSalah ? .primary : .secondary)
    .fontWeight(isNextSalah ? .semibold : .regular)
  }
}

// MARK: - TodaySalahRow_Previews

struct TodaySalahRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TodaySalahRow(salah: "Fajr", salahTime: "03:00")
        .previewDisplayName("Today Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()

      TodaySalahRow(salah: "Fajr", salahTime: "03:00", isNextSalah: true)
        .previewDisplayName("Today Next Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()
    }
  }
}
