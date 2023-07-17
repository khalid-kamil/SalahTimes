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

  func test_calendar_hasMosqueNameAndCalendar() {
    let sut = loader.loadMosque()

    XCTAssertEqual(sut.mosqueName, "JJME")
    XCTAssertGreaterThan(sut.mosqueCalendar.count, 0)
  }

}

// MARK: - MosqueLoader

struct MosqueLoader {
  func loadMosque() -> MosqueCalendar {
    MosqueCalendar(mosqueName: "JJME", mosqueCalendar: [""])
  }
}

// MARK: - MosqueCalendar

struct MosqueCalendar {
  let mosqueName: String
  let mosqueCalendar: [String]
}
