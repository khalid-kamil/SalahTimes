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

    XCTAssertEqual(loader.loadedTimes[0], "")
    XCTAssertEqual(loader.loadedTimes[1], "12:55")
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
  var loadedTimes = [String]()

  func loadMosque(name: String = "JJME") -> MosqueCalendar {
    MosqueCalendar(mosqueName: name, mosqueCalendar: [
      Day(date: createDate("18/07/2022"), fajr: createTime()),
      Day(date: createDate("19/07/2022"), fajr: createTime("12:55")),
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

  func createTime(_ timeAsString: String = "") -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_GB")
    dateFormatter.dateFormat = "hh:mm"
    if let time = dateFormatter.date(from: timeAsString) {
      loadedTimes.append(dateFormatter.string(from: time))
      return time
    }
    loadedTimes.append("")
    return Date(timeIntervalSinceNow: 118800)
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
  let fajr: Date?
}
