//
//  Calendar.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

struct Calendar: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hijri date".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                
                Text("Calendar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack{
                Spacer()
                Button {
                    print("")
                } label: {
                    Text("Full Month")
                        .fontWeight(.medium)
                        .font(.footnote)
                }
            }
            .padding(.horizontal)
            
            List {
                Section(header: Text("Dhul Hijja")) {
                    CalendarDayRow(weekDay: "Tue", day: "9")
                    CalendarDayRow(weekDay: "Wed", day: "10")
                    CalendarDayRow(weekDay: "Thu", day: "11")
                    CalendarDayRow(weekDay: "Fri", day: "12")
                    CalendarDayRow(weekDay: "Sat", day: "13")
                    CalendarDayRow(weekDay: "Sun", day: "14")
                }
                
                Section("Muharram") {
                    CalendarDayRow(weekDay: "Tue", day: "1")
                    CalendarDayRow(weekDay: "Wed", day: "2")
                    CalendarDayRow(weekDay: "Thu", day: "3")
                    CalendarDayRow(weekDay: "Fri", day: "4")
                    CalendarDayRow(weekDay: "Sat", day: "5")
                    CalendarDayRow(weekDay: "Sun", day: "6")
                }
            }
        }
        .background(Color(.secondarySystemBackground))
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
