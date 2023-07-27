//
//  TodaySalahRowView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

// MARK: - TodaySalahRowView

struct TodaySalahRowView: View {
  let salah: String
  let adhanTime: String
  let iqamaTime: String
  var isNextSalah = false

  var body: some View {
    VStack {
      HStack(alignment: .bottom) {
        Text(salah)
        Spacer()
        Text(adhanTime)
          .opacity(0.7)
          .padding(.trailing, 16)
        Text(iqamaTime)
          .opacity(iqamaTime == "99:99" ? 0 : 1)
      }
      .monospacedDigit()
      .fontWeight(isNextSalah ? .semibold : .regular)
      .foregroundColor(isNextSalah ? .accentColor : .secondary)
      .padding(.top)
      .padding(.horizontal)

      Divider()
        .padding(.leading)
        .opacity(salah == "Isha" ? 0 : 1)
    }
  }
}

// MARK: - TodaySalahRow_Previews

struct TodaySalahRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TodaySalahRowView(salah: "Fajr", adhanTime: "01:00", iqamaTime: "03:30")
        .previewDisplayName("Today Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()

      TodaySalahRowView(salah: "Fajr", adhanTime: "01:00", iqamaTime: "03:30", isNextSalah: true)
        .previewDisplayName("Today Next Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()
    }
  }
}
