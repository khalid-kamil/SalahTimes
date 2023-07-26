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
    Section(header: SectionHeaderView(text: "Today")) {
      TodaySalahRowView(
        salah: "Fajr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.fajr.start ?? Date()),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.fajr.congregation ?? Date()))
      TodaySalahRowView(
        salah: "Sunrise",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.sunrise ?? Date()),
        iqamaTime: "")
      TodaySalahRowView(
        salah: "Dhuhr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.dhuhr.start ?? Date()),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.dhuhr.congregation ?? Date()))
      TodaySalahRowView(
        salah: "Asr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.asr.start ?? Date()),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.asr.congregation ?? Date()))
      TodaySalahRowView(
        salah: "Maghrib",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.maghrib.start ?? Date()),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.maghrib.congregation ?? Date()))
      TodaySalahRowView(
        salah: "Isha",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.isha.start ?? Date()),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar.first?.isha.congregation ?? Date()))
    }
  }

  private var tomorrowsTimes: some View {
    Section(header: SectionHeaderView(text: "Tomorrow")) {
      TodaySalahRowView(
        salah: "Fajr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].fajr.start),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].fajr.congregation))
      TodaySalahRowView(
        salah: "Sunrise",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].sunrise),
        iqamaTime: "")
      TodaySalahRowView(
        salah: "Dhuhr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].dhuhr.start),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].dhuhr.congregation))
      TodaySalahRowView(
        salah: "Asr",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].asr.start),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].asr.congregation))
      TodaySalahRowView(
        salah: "Maghrib",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].maghrib.start),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].maghrib.congregation))
      TodaySalahRowView(
        salah: "Isha",
        adhanTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].isha.start),
        iqamaTime: vm.prayerTime(of: vm.sampleMosque.calendar[1].isha.congregation))
    }
  }
}

// MARK: - Today_Previews

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    TodayView()
  }
}
