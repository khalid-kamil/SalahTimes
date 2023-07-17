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

  let loader = MosqueLoader()

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
    let firstDay = sut.mosqueCalendar.first

    XCTAssertNotNil(firstDay?.date)
  }

  func test_calendar_dayHasFajr() {
    let sut = loader.loadMosque()
    let firstDay = sut.mosqueCalendar.first

    XCTAssertNotNil(firstDay?.fajr)
  }

}

// MARK: - MosqueLoader

struct MosqueLoader {
  func loadMosque(name: String = "JJME", calendar: [Day] = [Day(date: Date(), fajr: "")]) -> MosqueCalendar {
    MosqueCalendar(mosqueName: name, mosqueCalendar: calendar)
  }
}

// MARK: - MosqueCalendar

struct MosqueCalendar {
  let mosqueName: String
  let mosqueCalendar: [Day]
}

// MARK: - Day

struct Day {
  let date: Date
  let fajr: String
}
