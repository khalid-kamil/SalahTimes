//
//  SalahTimesTests.swift
//  SalahTimesTests
//
//  Created by Khalid Kamil on 27/06/2023.
//

import XCTest
@testable import SalahTimes

// MARK: - SalahTimesTests

final class SalahTimesTests: XCTestCase {

  let loader = MosqueLoaderSpy()

  func test_calendar_hasMosqueName() {
    let sut = loader.loadMosque()

    XCTAssertEqual(sut.mosqueName, "JJME")
  }

  func test_calendar_hasDays() {
    let sut = loader.loadMosque()

    XCTAssertGreaterThan(sut.mosqueCalendar.count, 0)
  }

  func test_calendar_dayHasDate() {
    let sut = loader.loadMosque()

    XCTAssertFalse(loader.loadedDates.isEmpty)
  }

  func test_calendar_createValidDateFromString() {
    let sut = loader.createDate("18/07/2023")

    XCTAssertEqual(loader.loadedDates[0], "18/07/2023")
  }

  func test_calendar_createValidTimeFromString() {
    let sut = loader.loadMosque()

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_GB")
    dateFormatter.dateFormat = "HH:mm"
    let startTime = dateFormatter.date(from: "12:55")
    let congregationTime = dateFormatter.date(from: "13:30")


    XCTAssertNil(loader.loadedTimes[0].start)
    XCTAssertNil(loader.loadedTimes[0].congregation)
    XCTAssertEqual(loader.loadedTimes[1].start, startTime)
    XCTAssertEqual(loader.loadedTimes[1].congregation, congregationTime)
  }

  func test_calendar_dayHasFajr() {
    let sut = loader.loadMosque()
    let firstDay = sut.mosqueCalendar.first

    XCTAssertNotNil(firstDay?.fajr)
  }

}

// MARK: - MosqueLoaderSpy

class MosqueLoaderSpy {
  var loadedDates = [String]()
  var loadedTimes = [PrayerTime]()

  func loadMosque(name: String = "JJME") -> MosqueCalendar {
    MosqueCalendar(mosqueName: name, mosqueCalendar: [
      Day(date: createDate("18/07/2022"), fajr: createTime(start: "", congregation: "")),
      Day(date: createDate("19/07/2022"), fajr: createTime(start: "12:55", congregation: "13:30")),
    ])
  }

  func createDate(_ dateAsString: String = "") -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_GB")
    dateFormatter.dateFormat = "dd/MM/yyyy"
    if let date = dateFormatter.date(from: dateAsString) {
      loadedDates.append(dateFormatter.string(from: date))
      return date
    }
    return Date(timeIntervalSinceNow: 118800)
  }

  func createTime(start: String, congregation: String) -> PrayerTime {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_GB")
    dateFormatter.dateFormat = "HH:mm"
    if
      let startTime = dateFormatter.date(from: start),
      let congregationTime = dateFormatter.date(from: congregation)
    {
      loadedTimes.append(PrayerTime(start: startTime, congregation: congregationTime))
      return PrayerTime(start: startTime, congregation: congregationTime)
    }
    loadedTimes.append(PrayerTime(start: nil, congregation: nil))
    return PrayerTime(start: nil, congregation: nil)
  }
}

// MARK: - MosqueCalendar

struct MosqueCalendar {
  let mosqueName: String
  let mosqueCalendar: [Day]
}

// MARK: - Day

struct Day {
  let date: Date?
  let fajr: PrayerTime?
}

// MARK: - PrayerTime

struct PrayerTime {
  let start: Date?
  let congregation: Date?
}
