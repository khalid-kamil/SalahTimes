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

    @Published var todaysTimes = [String]()
    @Published var tomorrowsTimes = [String]()
    @Published var showMosqueInformation = false

    var mosqueName = "JJME"
    var fajrStart = "03:02"
    var fajrCongregation = "04:00"
    var sunriseStart = "04:55"
    var dhuhrStart = "13:04"
    var dhuhrCongregation = "13:30"
    var asrStart = "17:24"
    var asrCongregation = "18:00"
    var maghribStart = "21:13"
    var maghribCongregation = "21:15"
    var ishaStart = "22:23"
    var ishaCongregation = "22:30"

    @Published var mosque = MosqueLoader(client: mosqueClient())

    var sampleMosque: Mosque {
      mosque.loadSampleMosque()
    }

    var hijriDate: String {
      dateFormatter.calendar = .init(identifier: .islamic)
      dateFormatter.dateStyle = .full
      return dateFormatter.string(from: today)
    }

    var gregorianDate: String {
      today.formatted(date: .abbreviated, time: .omitted)
    }

    func prayerTime(of date: Date) -> String {
      let formatter = DateFormatter()
      formatter.timeStyle = .medium
      return formatter.string(from: date)
    }

    // MARK: Private

    private var today = Date()
    private let dateFormatter = DateFormatter()
  }
}
