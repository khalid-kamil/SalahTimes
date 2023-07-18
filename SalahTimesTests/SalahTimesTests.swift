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

    var loadedDates = [String]()
    var loadedTimes = [PrayerTime]()

    func get(mosque: String) {
      loadedMosque = Mosque(name: mosque, calendar: sampleCalendar)
    }
  }

  let client = ClientSpy()

  func test_calendar_hasMosqueName() {
    let sut = makeSUT()

    sut.loadMosque(name: "JJME")

    XCTAssertNotNil(client.loadedMosque)
    XCTAssertEqual(client.loadedMosque?.name, "JJME")
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
  let date: Date?
  let fajr: PrayerTime?
}

// MARK: - PrayerTime

struct PrayerTime {
  let start: Date?
  let congregation: Date?
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
    client.get(mosque: name)
  }

  // MARK: Private

  private let client: Client

}
