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

  // MARK: - ClientSpy

  class ClientSpy: Client {
    var loadedMosque: Mosque? = nil

    var sampleCalendar = [Day]()

    func get(mosque: String) {
      loadedMosque = Mosque(name: mosque, calendar: sampleCalendar)
    }
  }

  let client = ClientSpy()

  var defaultDate: Date {
    Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 18))!
  }

  func test_loadedMosqueWithNoName_returnsNil() {
    let sut = makeSUT()

    sut.loadMosque(name: "")

    XCTAssertNil(client.loadedMosque)
  }

  func test_loadedMosqueWithName_hasCorrectName() {
    let sut = makeSUT()

    sut.loadMosque(name: "JJME")

    XCTAssertNotNil(client.loadedMosque)
    XCTAssertEqual(client.loadedMosque?.name, "JJME")
  }

  func test_loadedMosqueWithNoDays_deliversEmptyCalendar() {
    let sut = makeSUT()

    sut.loadMosque(name: "JJME")

    XCTAssertEqual(client.loadedMosque?.calendar.count, 0)
  }

  func test_calendarWithOneDay_loadsMosqueCalendarWithOneDay() {
    let sut = makeSUT()
    client.sampleCalendar = [Day(
      date: defaultDate,
      fajr: .init(start: defaultDate, congregation: defaultDate),
      sunrise: .init(start: defaultDate, congregation: defaultDate),
      dhuhr: .init(start: defaultDate, congregation: defaultDate),
      asr: .init(start: defaultDate, congregation: defaultDate),
      maghrib: .init(start: defaultDate, congregation: defaultDate),
      isha: .init(start: defaultDate, congregation: defaultDate))]

    sut.loadMosque(name: "JJME")

    XCTAssertEqual(client.loadedMosque?.calendar.count, 1)
  }

  // MARK: Helpers
  func makeSUT() -> MosqueLoader {
    MosqueLoader(client: client)
  }

}

// MARK: - Mosque

struct Mosque {
  let name: String
  let calendar: [Day]
}

// MARK: - Day

struct Day {
  let date: Date
  let fajr: PrayerTime
  let sunrise: PrayerTime
  let dhuhr: PrayerTime
  let asr: PrayerTime
  let maghrib: PrayerTime
  let isha: PrayerTime
}

// MARK: - PrayerTime

struct PrayerTime {
  let start: Date
  let congregation: Date
}

// MARK: - Client

protocol Client {
  func get(mosque: String)
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
      client.get(mosque: name)
    }
  }

  // MARK: Private

  private let client: Client

}
