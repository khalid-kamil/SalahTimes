//
//  TodayView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - TodayView

struct TodayView: View {
  private let mosque = "Acton Mosque"
  @State private var showMosqueInformation = false
  @State private var displayHijriDate = true

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        hijriHeader
        mosqueName
        todaysTimes
        tomorrowsTimes
        Spacer()
        Spacer()
      }
      .padding(.horizontal, 16)
    }
    .padding(.top, 1)
  }
}

extension TodayView {
  private var hijriHeader: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(displayHijriDate ? Date().hijriFormat : Date().gregorianFormat)
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundColor(.secondary)
        .padding(.top)
        .onTapGesture {
          displayHijriDate.toggle()
        }
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
      MosqueInformationView(mosqueName: mosque)
    }
  }

  private var todaysTimes: some View {
    Section(header: SectionHeaderView(text: "Today")) {
      TodaySalahRowView(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
      TodaySalahRowView(salah: "Dhuhr", adhanTime: "03:00", iqamaTime: "13:00")
      TodaySalahRowView(salah: "Asr", adhanTime: "03:00", iqamaTime: "18:00", isNextSalah: true)
      TodaySalahRowView(salah: "Maghrib", adhanTime: "03:00", iqamaTime: "21:25")
      TodaySalahRowView(salah: "Isha", adhanTime: "03:00", iqamaTime: "22:45")
    }
  }

  private var tomorrowsTimes: some View {
    Section(header: SectionHeaderView(text: "Tomorrow")) {
      TodaySalahRowView(salah: "Fajr", adhanTime: "03:00", iqamaTime: "03:00")
    }
  }
}

extension Date {
  var gregorianFormat: String {
    formatted(date: .complete, time: .omitted)
  }

  var hijriFormat: String {
    let formatter = DateFormatter()
    formatter.calendar = .init(identifier: .islamic)
    formatter.dateStyle = .full
    return formatter.string(from: self)
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    TodayView()
  }
}
