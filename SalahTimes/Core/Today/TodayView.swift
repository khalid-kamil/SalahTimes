//
//  TodayView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - TodayView

struct TodayView: View {
  @StateObject private var vm = TodayViewModel()
  let data = ["Row 1", "Row 2", "Row 3", "Row 4", "Row 5"]

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        todaysDate
        mosqueName
        todaysTimes
        tomorrowsTimes
      }
      .padding(.horizontal, 16)
    }
    .padding(.top, 1)
    .background(Color(.secondarySystemBackground))
  }
}

extension TodayView {
  private var todaysDate: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("\(vm.hijriDate)  •  \(vm.gregorianDate)")
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
      Text(vm.sampleMosque.name)
        .font(.title2)
        .fontWeight(.semibold)
      Button {
        vm.showMosqueInformation.toggle()
      } label: {
        Image(systemName: "info.circle")
          .foregroundColor(.accentColor)
      }
    }
    .sheet(isPresented: $vm.showMosqueInformation) {
      MosqueInformationView(mosqueName: vm.sampleMosque.name)
    }
  }

  private var todaysTimes: some View {
    VStack {
      SectionHeaderView(text: "Today")
      VStack(spacing: 0) {
        TodaySalahRowView(
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.salah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.salah.fajr.congregation))
        TodaySalahRowView(
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.salah.sunrise),
          iqamaTime: "99:99")
        TodaySalahRowView(
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.salah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.salah.dhuhr.congregation))
        TodaySalahRowView(
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.salah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.salah.asr.congregation))
        TodaySalahRowView(
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.salah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.salah.maghrib.congregation))
        TodaySalahRowView(
          salah: "Isha",
          adhanTime: vm.stringFormat(of: vm.salah.isha.start),
          iqamaTime: vm.stringFormat(of: vm.salah.isha.congregation))
      }
      .background(.background)
      .cornerRadius(12)
    }
    .padding(.bottom)
  }

  private var tomorrowsTimes: some View {
    VStack(spacing: 8) {
      SectionHeaderView(text: "Tomorrow")
      VStack(spacing: 0) {
        TodaySalahRowView(
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.congregation))
        TodaySalahRowView(
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.sunrise),
          iqamaTime: "99:99")
        TodaySalahRowView(
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.congregation))
        TodaySalahRowView(
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.asr.congregation))
        TodaySalahRowView(
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.congregation))
        TodaySalahRowView(
          salah: "Isha",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.isha.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.isha.congregation))
      }
      .background(.background)
      .cornerRadius(12)
    }
    .padding(.bottom)
  }

}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    TodayView()
  }
}
