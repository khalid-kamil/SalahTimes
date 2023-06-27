//
//  CalendarDayRow.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

struct CalendarDayRow: View {
    let weekDay: String
    let day: String
    
    var body: some View {
        HStack {
            VStack {
                Text(weekDay.uppercased())
                    .fontWeight(.semibold)
                    .font(.caption2)
                    .foregroundColor(.accentColor)
                
                Text(day)
                    .font(.title3)
                    .fontWeight(.light)
                
            }
            .padding(.vertical, 2)
            .padding(.trailing)
            
            
            ScrollView(.horizontal) {
                HStack {
                    CalendarSalahCell(salahName: "Fajr", salahTime: "02:49", iqamaTime: "03:09")
                    CalendarSalahCell(salahName: "Sunrise", salahTime: "04:45")
                    CalendarSalahCell(salahName: "Dhuhr", salahTime: "13:09", iqamaTime: "13:30")
                    CalendarSalahCell(salahName: "Asr", salahTime: "17:27", iqamaTime: "18:00")
                    CalendarSalahCell(salahName: "Maghrib", salahTime: "21:24", iqamaTime: "21:24")
                    CalendarSalahCell(salahName: "Isha", salahTime: "22:36", iqamaTime: "22:45")
                }
                
            }
            
        }
    }
}

struct CalendarDayRow_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDayRow(weekDay: "Tue", day: "9")
            .previewDisplayName("Calendar Day Row")
            .previewLayout(.sizeThatFits)
            .background(Color(.secondarySystemBackground))
            .padding()
    }
}
