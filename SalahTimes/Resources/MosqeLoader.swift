//
//  MosqeLoader.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 19/07/2023.
//

import Foundation

// MARK: - Client

protocol Client {
  func get(mosque: String)
}

// MARK: - mosqueClient

class mosqueClient: Client {
  func get(mosque _: String) { }
}

// MARK: - MosqueLoader

class MosqueLoader {

  // MARK: Lifecycle

  init(client: Client) {
    self.client = client
  }

  // MARK: Internal

  func loadMosque(name: String) {
    if !name.isEmpty {
      client?.get(mosque: name)
    }
  }

  func loadSampleMosque() -> Mosque {
    var calendar = [Day]()
    let year = 2023
    let monthsData = [
      (1, 31),
      (2, 28),
      (3, 31),
      (4, 30),
      (5, 31),
      (6, 30),
      (7, 31),
      (8, 31),
      (9, 30),
      (10, 31),
      (11, 30),
      (12, 31),
    ]

    for (month, numberOfDays) in monthsData {
      for i in 1...numberOfDays {
        let date = Calendar.current.date(from: DateComponents(year: year, month: month , day: i))!

        let fajr = sampleSalah(of: date, startHour: 3, startMinute: i, jamaahHour: 4, jamaahMinute: 15)
        let sunrise = Calendar.current.date(bySettingHour: 5, minute: 00, second: 0, of: date)!
        let dhuhr = sampleSalah(of: date, startHour: 12, startMinute: i, jamaahHour: 13, jamaahMinute: 30)
        let asr = sampleSalah(of: date, startHour: 18, startMinute: i, jamaahHour: 19, jamaahMinute: 00)
        let maghrib = sampleSalah(of: date, startHour: 21, startMinute: i, jamaahHour: 21, jamaahMinute: i + 3)
        let isha = sampleSalah(of: date, startHour: 22, startMinute: i, jamaahHour: 22, jamaahMinute: 45)

        calendar.append(Day(date: date, fajr: fajr, sunrise: sunrise, dhuhr: dhuhr, asr: asr, maghrib: maghrib, isha: isha))
      }
    }

    return Mosque(name: "JJME", calendar: calendar)
  }

  func sampleSalah(of date: Date, startHour: Int, startMinute: Int, jamaahHour: Int, jamaahMinute: Int) -> PrayerTime {
    let startTime = Calendar.current.date(bySettingHour: startHour, minute: startMinute, second: 0, of: date)
    let congregationTime = Calendar.current.date(bySettingHour: jamaahHour, minute: jamaahMinute, second: 0, of: date)
    return PrayerTime(start: startTime ?? date, congregation: congregationTime ?? date)
  }

  // MARK: Private

  private let client: Client?

}
