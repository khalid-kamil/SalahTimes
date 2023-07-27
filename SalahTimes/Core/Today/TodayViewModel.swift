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
    @Published var today = Date()

    var sampleMosque: Mosque {
      mosque.loadSampleMosque()
    }

    var todaySalah: Day {
      sampleMosque.calendar.filter {
        Calendar.current.isDate($0.date, equalTo: today, toGranularity: .day)
      }.last ?? sampleMosque.calendar[0]
    }

    var tomorrowSalah: Day {
      let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
      let salah = sampleMosque.calendar.filter {
        Calendar.current.isDate($0.date, equalTo: tomorrow, toGranularity: .day)
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

    func refreshDate() {
      nextSalahIsHighlighted = false
      today = Date.now
    }

    func stringFormat(of date: Date) -> String {
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      return formatter.string(from: date)
    }

    func isNextSalah(_ salah: Date) -> Bool {
      if salah < today || nextSalahIsHighlighted {
        return false
      }
      nextSalahIsHighlighted = true
      return true
    }

    // MARK: Private

    private var mosque = MosqueLoader(client: mosqueClient())
    private let dateFormatter = DateFormatter()
    private var nextSalahIsHighlighted = false
  }
}
