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
      Text(vm.mosqueName)
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
      MosqueInformationView(mosqueName: vm.mosqueName)
    }
  }

  private var todaysTimes: some View {
    Section(header: SectionHeaderView(text: "Today")) {
      TodaySalahRowView(
        salah: "Fajr",
        adhanTime: vm.todaysTimes2?.prayerTimes.fajr.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.fajr.congregationTime ?? "")
      TodaySalahRowView(
        salah: "Sunrise",
        adhanTime: vm.todaysTimes2?.prayerTimes.sunrise.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.sunrise.congregationTime ?? "")
      TodaySalahRowView(
        salah: "Dhuhr",
        adhanTime: vm.todaysTimes2?.prayerTimes.dhuhr.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.dhuhr.congregationTime ?? "")
      TodaySalahRowView(
        salah: "Asr",
        adhanTime: vm.todaysTimes2?.prayerTimes.asr.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.asr.congregationTime ?? "")
      TodaySalahRowView(
        salah: "Maghrib",
        adhanTime: vm.todaysTimes2?.prayerTimes.maghrib.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.maghrib.congregationTime ?? "")
      TodaySalahRowView(
        salah: "Isha",
        adhanTime: vm.todaysTimes2?.prayerTimes.isha.beginningTime ?? "",
        iqamaTime: vm.todaysTimes2?.prayerTimes.isha.congregationTime ?? "")
    }
  }

  private var tomorrowsTimes: some View {
    Section(header: SectionHeaderView(text: "Tomorrow")) { }
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    TodayView()
  }
}
