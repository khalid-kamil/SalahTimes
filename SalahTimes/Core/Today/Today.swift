//
//  Today.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - Today

struct Today: View {
  private let mosque = "Acton Mosque"
  @State private var showMosqueInformation = false

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      hijriHeader
      mosqueName
      Spacer()
      todaysTimes
      tomorrowsTimes
      Spacer()
      Spacer()
    }
    .padding(.horizontal, 16)
  }
}

extension Today {
  private var hijriHeader: some View {
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
  }

  private var mosqueName: some View {
    HStack {
      Text(mosque)
        .font(.title2)
        .fontWeight(.semibold)
      Button {
        showMosqueInformation.toggle()
      } label: {
        Image(systemName: "info.circle")
          .foregroundColor(.accentColor)
      }
    }
    .sheet(isPresented: $showMosqueInformation) {
      MosqueInformation(mosqueName: mosque)
    }
  }

  private var todaysTimes: some View {
    Section(header: SectionHeader(text: "Today")) {
      TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
      TodaySalahRow(salah: "Dhuhr", adhanTime: "03:00", iqamaTime: "13:00")
      TodaySalahRow(salah: "Asr", adhanTime: "03:00", iqamaTime: "18:00", isNextSalah: true)
      TodaySalahRow(salah: "Maghrib", adhanTime: "03:00", iqamaTime: "21:25")
      TodaySalahRow(salah: "Isha", adhanTime: "03:00", iqamaTime: "22:45")
    }
  }

  private var tomorrowsTimes: some View {
    Section(header: SectionHeader(text: "Tomorrow")) {
      TodaySalahRow(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
    }
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
  }
}
