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
        adhanTime: vm.fajrStart,
        iqamaTime: vm.fajrCongregation)
      TodaySalahRowView(
        salah: "Sunrise",
        adhanTime: vm.sunriseStart,
        iqamaTime: "")
      TodaySalahRowView(
        salah: "Dhuhr",
        adhanTime: vm.dhuhrStart,
        iqamaTime: vm.dhuhrCongregation)
      TodaySalahRowView(
        salah: "Asr",
        adhanTime: vm.asrStart,
        iqamaTime: vm.asrCongregation)
      TodaySalahRowView(
        salah: "Maghrib",
        adhanTime: vm.maghribStart,
        iqamaTime: vm.maghribCongregation)
      TodaySalahRowView(
        salah: "Isha",
        adhanTime: vm.ishaStart,
        iqamaTime: vm.ishaCongregation)
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
