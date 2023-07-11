//
//  Today.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - Today

struct Today: View {
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 0) {
        Text("Hijri date".uppercased())
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
        Text("Today")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
      .padding()

      HStack {
        Text("Enfield Mosque")
          .font(.title2)
          .fontWeight(.semibold)
        Button {
          print("Get directions to mosque...")
        } label: {
          Image(systemName: "map")
            .foregroundColor(.accentColor)
        }
      }
      .padding()

      List {
        Section("Today") {
          TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
          TodaySalahRow(salah: "Dhuhr", adhanTime: "03:00", iqamaTime: "13:00")
          TodaySalahRow(salah: "Asr", adhanTime: "03:00", iqamaTime: "18:00", isNextSalah: true)
          TodaySalahRow(salah: "Maghrib", adhanTime: "03:00", iqamaTime: "21:25")
          TodaySalahRow(salah: "Isha", adhanTime: "03:00", iqamaTime: "22:45")
        }

        Section("Tomorrow") {
          TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
        }
      }
    }
    .background(Color(.secondarySystemBackground))
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
  }
}
