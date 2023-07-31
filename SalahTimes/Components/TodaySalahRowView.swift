//
//  TodaySalahRowView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

// MARK: - TodaySalahRowView

struct TodaySalahRowView: View {
  let symbol: String
  let salah: String
  let adhanTime: String
  let iqamaTime: String
  var isNextSalah = false

  var body: some View {
    VStack {
      HStack(alignment: .bottom) {
        Image(systemName: symbol)
//          .frame(width: 20)
        Text(salah)
        Spacer()
        Text(adhanTime)
          .opacity(0.7)
          .padding(.trailing, 8)
        Text(iqamaTime)
          .fixedSize(horizontal: false, vertical: true)
          .frame(width: 80, alignment: .trailing)
      }
      .monospacedDigit()
      .fontWeight(.semibold)
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
      TodaySalahRowView(symbol: "sunrise", salah: "Fajr", adhanTime: "01:00 AM", iqamaTime: "03:30 AM")
        .previewDisplayName("Today Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()

      TodaySalahRowView(symbol: "sunrise", salah: "Fajr", adhanTime: "01:00 PM", iqamaTime: "03:30 AM", isNextSalah: true)
        .previewDisplayName("Today Next Salah Row")
        .previewLayout(.sizeThatFits)
        .background(Color(.secondarySystemBackground))
        .padding()
    }
  }
}
