//
//  TodayView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

// MARK: - TodayView

struct TodayView: View {

  // MARK: Internal

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 16) {
          todaysTimes
          tomorrowsTimes
        }
        .padding(.horizontal, 16)
      }
      .background(Color(.secondarySystemBackground))
      .navigationTitle(vm.sampleMosque.name)
    }
  }

  // MARK: Private

  @StateObject private var vm = TodayViewModel()

}

extension TodayView {

  private var todaysTimes: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 0) {
        Text("\(vm.getHijriDate(for: vm.today))")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
          .padding(.top)
        Text("\(vm.getGregorianDate(for: vm.today))")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
        Text("Today")
          .font(.title)
          .fontWeight(.semibold)
      }
      VStack(spacing: 0) {
        HStack {
          Text("Salah")
          Spacer()
          Text("Adhan")
            .padding(.trailing, 8)
          Text("Jama'ah")
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 80, alignment: .trailing)
        }
        .fontWeight(.semibold)
        .foregroundColor(.secondary)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.secondarySystemBackground).opacity(0.4))
        Divider()

        TodaySalahRowView(
          symbol: "sunrise",
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.fajr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.fajr.congregation))
        TodaySalahRowView(
          symbol: "sun.min",
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.todaySalah.sunrise),
          iqamaTime: "",
          isNextSalah: vm.isNextSalah(vm.todaySalah.sunrise))
        TodaySalahRowView(
          symbol: "sun.max.fill",
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.dhuhr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.dhuhr.congregation))
        TodaySalahRowView(
          symbol: "sun.and.horizon",
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.asr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.asr.congregation))
        TodaySalahRowView(
          symbol: "sunset",
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.todaySalah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.maghrib.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.maghrib.congregation))
        TodaySalahRowView(
          symbol: "moon.stars",
          salah: "Isha",
          adhanTime: vm.stringFormat(of: vm.todaySalah.isha.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.isha.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.isha.congregation))
      }
      .background(.background)
      .cornerRadius(12)
    }
    .padding(.bottom)
  }

  private var tomorrowsTimes: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 0) {
        Text("\(vm.getHijriDate(for: vm.tomorrow))")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
          .padding(.top)
        Text("\(vm.getGregorianDate(for: vm.tomorrow))")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(.secondary)
        Text("Tomorrow")
          .font(.title)
          .fontWeight(.semibold)
      }
      VStack(spacing: 0) {
        HStack {
          Text("Salah")
          Spacer()
          Text("Adhan")
            .padding(.trailing, 8)
          Text("Jama'ah")
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 80, alignment: .trailing)
        }
        .fontWeight(.semibold)
        .foregroundColor(.secondary)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.secondarySystemBackground).opacity(0.4))
        Divider()

        TodaySalahRowView(
          symbol: "sunrise",
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.fajr.congregation))
        TodaySalahRowView(
          symbol: "sun.min",
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.sunrise),
          iqamaTime: "",
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.sunrise))
        TodaySalahRowView(
          symbol: "sun.max",
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.dhuhr.congregation))
        TodaySalahRowView(
          symbol: "sun.and.horizon",
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.asr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.asr.congregation))
        TodaySalahRowView(
          symbol: "sunset",
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.maghrib.congregation))
        TodaySalahRowView(
          symbol: "moon.stars",
          salah: "Isha",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.isha.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.isha.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.isha.congregation))
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
