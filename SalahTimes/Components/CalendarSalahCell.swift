//
//  CalendarSalahCell.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 28/06/2023.
//

import SwiftUI

struct CalendarSalahCell: View {
    let salahName: String
    let salahTime: String
    let iqamaTime: String?
    
    init(salahName: String, salahTime: String, iqamaTime: String? = nil) {
        self.salahName = salahName
        self.salahTime = salahTime
        self.iqamaTime = iqamaTime
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(salahName.uppercased())
                    .fontWeight(.semibold)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Text(salahTime)
            }
            
            VStack {
                
                if let iqama = iqamaTime {
                    Text("Iqama".uppercased())
                        .fontWeight(.semibold)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Text(iqama)
                }
                
            }
        }
        .padding(.trailing)
    }
}

struct CalendarSalahCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSalahCell(salahName: "Fajr", salahTime: "02:49", iqamaTime: "03:09")
            .previewDisplayName("Calendar Salah Cell")
            .previewLayout(.sizeThatFits)
            .background(Color(.secondarySystemBackground))
            .padding()
    }
}
