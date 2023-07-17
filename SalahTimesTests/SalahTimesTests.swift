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

}

// MARK: - MosqueLoader

struct MosqueLoader {
  func loadMosque() -> MosqueCalendar {
    MosqueCalendar(mosqueName: "JJME")
  }
}

// MARK: - MosqueCalendar

struct MosqueCalendar {
  let mosqueName: String
}
