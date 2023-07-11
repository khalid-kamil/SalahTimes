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
  let adhanTime: String
  let iqamaTime: String
  var isNextSalah = false

  var body: some View {
    HStack(alignment: .bottom) {
      Text(salah)
      Spacer()
      Text(adhanTime)
        .foregroundColor(.secondary)
        .padding(.trailing, 8)
      Text(iqamaTime)
    }
    .foregroundColor(isNextSalah ? .accentColor : .secondary)
    .fontWeight(isNextSalah ? .semibold : .regular)
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(
          isNextSalah ? Color.accentColor : Color.secondary,
          lineWidth: isNextSalah ? 2 : 1))
  }
}

// MARK: - TodaySalahRow_Previews

struct TodaySalahRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:30")
        .previewDisplayName("Today Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()

      TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:30", isNextSalah: true)
        .previewDisplayName("Today Next Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()
    }
  }
}
