//
//  Today.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 27/06/2023.
//

import SwiftUI

struct Today: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hijri date".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack {
                Text("Enfield Mosque")
                    .font(.title2)
                    .fontWeight(.semibold)
                Button {
                    print("Get directions to mosque...")
                } label: {
                    Image(systemName: "map")
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
            
            List {
                Section(header: HStack {
                    Text("Today")
                    Spacer()
                    Button {
                        print("Adhan")
                    } label: {
                        Text("Adhan")
                            .fontWeight(.medium)
                            .font(.footnote)
                    }
                }){
                    TodaySalahRow(salah: "Fajr", salahTime: "03:00")
                    TodaySalahRow(salah: "Dhuhr", salahTime: "13:00")
                    TodaySalahRow(salah: "Asr", salahTime: "18:00", isNextSalah: true)
                    TodaySalahRow(salah: "Maghrib", salahTime: "21:25")
                    TodaySalahRow(salah: "Isha", salahTime: "22:45")
                }
                
                Section("Tomorrow") {
                    TodaySalahRow(salah: "Fajr", salahTime: "03:00")
                }
            }
        }
        .background(Color(.secondarySystemBackground))
        
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        Today()
    }
}
