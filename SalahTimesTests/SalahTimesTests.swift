//
//  SalahTimesTests.swift
//  SalahTimesTests
//
//  Created by Khalid Kamil on 27/06/2023.
//

import XCTest
@testable import SalahTimes

final class SalahTimesTests: XCTestCase {

  let loader = MosqueLoader()

  func test_calendar_hasMosqueName() {
    let sut = loader.loadMosqueCalendar()

    XCTAssertEqual(sut.mosqueName, "JJME")
  }

}
