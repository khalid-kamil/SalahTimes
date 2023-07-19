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
      sunrise: defaultDate,
      dhuhr: .init(start: defaultDate, congregation: defaultDate),
      asr: .init(start: defaultDate, congregation: defaultDate),
      maghrib: .init(start: defaultDate, congregation: defaultDate),
      isha: .init(start: defaultDate, congregation: defaultDate))]

    sut.loadMosque(name: "JJME")

    XCTAssertEqual(client.loadedMosque?.calendar.count, 1)
  }

  func test_makeSampleJsonFromMosqueCalendar() throws {
    let sut = makeSUT().loadSampleMosque()

    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(sut)
    let jsonString = try XCTUnwrap(String(data: data, encoding: .utf8))

    print(jsonString)
    print("isha cong: \(Date(timeIntervalSinceReferenceDate: 725755500))")
    print("last day: \(Date(timeIntervalSinceReferenceDate: 725673600))")
  }

  // MARK: Helpers
  func makeSUT() -> MosqueLoader {
    MosqueLoader(client: client)
  }

}

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

  private let client: Client

}
