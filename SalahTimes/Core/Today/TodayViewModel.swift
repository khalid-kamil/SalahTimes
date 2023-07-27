//
//  TodayViewModel.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 13/07/2023.
//

import Foundation

// MARK: - TodayView.TodayViewModel

extension TodayView {
  @MainActor
  class TodayViewModel: ObservableObject {

    // MARK: Internal

    @Published var showMosqueInformation = false

    var sampleMosque: Mosque {
      mosque.loadSampleMosque()
    }

    var salah: Day {
      sampleMosque.calendar.filter {
        Calendar.current.isDate($0.date, equalTo: today, toGranularity: .day)
      }.last ?? sampleMosque.calendar[0]
    }

    var tomorrowSalah: Day {
      let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
      let salah = sampleMosque.calendar.filter {
        Calendar.current.isDate($0.date, equalTo: today, toGranularity: .day)
      }.last ?? sampleMosque.calendar[0]
      return salah
    }

    var hijriDate: String {
      dateFormatter.calendar = .init(identifier: .islamic)
      dateFormatter.dateStyle = .full
      return dateFormatter.string(from: today)
    }

    var gregorianDate: String {
      today.formatted(date: .abbreviated, time: .omitted)
    }

    func stringFormat(of date: Date) -> String {
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      return formatter.string(from: date)
    }

    // MARK: Private

    private var mosque = MosqueLoader(client: mosqueClient())
    private var today = Date()
    private let dateFormatter = DateFormatter()
  }
}
