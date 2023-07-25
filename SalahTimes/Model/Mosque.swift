//
//  Mosque.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 19/07/2023.
//

import Foundation

// MARK: - Mosque

struct Mosque: Encodable {
  let name: String
  let calendar: [Day]
}

// MARK: - Day

struct Day: Encodable {
  let date: Date
  let fajr: PrayerTime
  let sunrise: Date
  let dhuhr: PrayerTime
  let asr: PrayerTime
  let maghrib: PrayerTime
  let isha: PrayerTime
}

// MARK: - PrayerTime

struct PrayerTime: Encodable {
  let start: Date
  let congregation: Date
}
