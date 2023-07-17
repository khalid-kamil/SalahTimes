//
//  TodayViewModel.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 13/07/2023.
//

import Foundation

// MARK: - TodayView.TodayViewModel

extension TodayView {
  @MainActor
  class TodayViewModel: ObservableObject {

    // MARK: Internal

    @Published var todaysTimes = [String]()
    @Published var tomorrowsTimes = [String]()
    @Published var showMosqueInformation = false

    var hijriDate: String {
      dateFormatter.calendar = .init(identifier: .islamic)
      dateFormatter.dateStyle = .full
      return dateFormatter.string(from: today)
    }

    var gregorianDate: String {
      today.formatted(date: .abbreviated, time: .omitted)
    }

    var mosqueName = "JJME"
    



    // MARK: Private

    private var today = Date()
    private let dateFormatter = DateFormatter()
  }
}
