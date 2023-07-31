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
    VStack {
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
        SectionHeaderView()
      }
      VStack(spacing: 0) {
        TodaySalahRowView(
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.fajr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.fajr.congregation))
        TodaySalahRowView(
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.todaySalah.sunrise),
          iqamaTime: "99:99",
          isNextSalah: vm.isNextSalah(vm.todaySalah.sunrise))
        TodaySalahRowView(
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.dhuhr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.dhuhr.congregation))
        TodaySalahRowView(
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.todaySalah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.asr.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.asr.congregation))
        TodaySalahRowView(
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.todaySalah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.todaySalah.maghrib.congregation),
          isNextSalah: vm.isNextSalah(vm.todaySalah.maghrib.congregation))
        TodaySalahRowView(
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
    VStack(spacing: 8) {
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
        SectionHeaderView()
      }
      VStack(spacing: 0) {
        TodaySalahRowView(
          salah: "Fajr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.fajr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.fajr.congregation))
        TodaySalahRowView(
          salah: "Sunrise",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.sunrise),
          iqamaTime: "99:99",
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.sunrise))
        TodaySalahRowView(
          salah: "Dhuhr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.dhuhr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.dhuhr.congregation))
        TodaySalahRowView(
          salah: "Asr",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.asr.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.asr.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.asr.congregation))
        TodaySalahRowView(
          salah: "Maghrib",
          adhanTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.start),
          iqamaTime: vm.stringFormat(of: vm.tomorrowSalah.maghrib.congregation),
          isNextSalah: vm.isNextSalah(vm.tomorrowSalah.maghrib.congregation))
        TodaySalahRowView(
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
