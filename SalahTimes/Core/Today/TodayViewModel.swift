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

    // MARK: Lifecycle

    init() {
      loadMosqueData()
    }

    // MARK: Internal

    @Published var todaysTimes = [String]()
    @Published var tomorrowsTimes = [String]()
    @Published var showMosqueInformation = false

    @Published private(set) var mosque: Mosque?

    var hijriDate: String {
      dateFormatter.calendar = .init(identifier: .islamic)
      dateFormatter.dateStyle = .full
      return dateFormatter.string(from: today)
    }

    var gregorianDate: String {
      today.formatted(date: .abbreviated, time: .omitted)
    }

    var mosqueName: String {
      mosque?.name ?? ""
    }

    var todaysTimes2: Day? {
      mosque?.prayerCalendar.filter {
        $0.date == "15-07-2023"
      }.first
    }

    func loadMosqueData() {
      guard let url = Bundle.main.url(forResource: "MosqueData", withExtension: "json") else {
        fatalError("Could not load \"MosqueData.json\" from bundle.")
      }
      let data = try? Data(contentsOf: url)
      let mosque = try? JSONDecoder().decode(Mosque.self, from: data!)
      self.mosque = mosque!
    }

    // MARK: Private

    private var today = Date()
    private let dateFormatter = DateFormatter()
  }
}

// MARK: - Times

struct Times: Codable {
  let beginningTime: String
  let congregationTime: String

  enum CodingKeys: String, CodingKey {
    case beginningTime = "beginning_time"
    case congregationTime = "congregation_time"
  }
}

// MARK: - PrayerTimes

struct PrayerTimes: Codable {
  let fajr: Times
  let sunrise: Times
  let dhuhr: Times
  let asr: Times
  let maghrib: Times
  let isha: Times
}

// MARK: - Day

struct Day: Codable {
  let date: String
  let prayerTimes: PrayerTimes

  enum CodingKeys: String, CodingKey {
    case date
    case prayerTimes = "prayer_times"
  }
}

// MARK: - Mosque

struct Mosque: Codable {
  var name: String
  var prayerCalendar: [Day]

  enum CodingKeys: String, CodingKey {
    case name
    case prayerCalendar = "prayer_calendar"
  }
}
