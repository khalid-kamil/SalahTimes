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
    VStack(alignment: .leading, spacing: 16) {
      VStack(alignment: .leading, spacing: 0) {
        Text("Hijri date".uppercased())
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
          .padding(.top)
        Text("Today")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
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
      Spacer()
      Section(header: Text("Today").padding(.top)) {
        TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
        TodaySalahRow(salah: "Dhuhr", adhanTime: "03:00", iqamaTime: "13:00")
        TodaySalahRow(salah: "Asr", adhanTime: "03:00", iqamaTime: "18:00", isNextSalah: true)
        TodaySalahRow(salah: "Maghrib", adhanTime: "03:00", iqamaTime: "21:25")
        TodaySalahRow(salah: "Isha", adhanTime: "03:00", iqamaTime: "22:45")
      }

      Section(header: Text("Tomorrow").padding(.top)) {
        TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
      }

      Spacer()
      Spacer()
    }
    .padding(.horizontal, 16)
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
  }
}
