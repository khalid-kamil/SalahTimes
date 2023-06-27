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
                Section(header: HStack{
                    Text("Today")
                    Spacer()
                    Button {
                        print("Adhan")
                    } label: {
                        Text("Adhan")
                            .fontWeight(.medium)
                            .font(.footnote)
                    }
                    
                }) {
                    HStack {
                        Text("Fajr")
                        Spacer()
                        Text("03:00")
                    }
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Dhuhr")
                        Spacer()
                        Text("13:00")
                    }
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                    
                    HStack {
                        Text("Asr")
                        Spacer()
                        Text("18:00")
                    }
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Maghrib")
                        Spacer()
                        Text("21:25")
                    }
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Isha")
                        Spacer()
                        Text("22:45")
                    }
                    .foregroundColor(.secondary)
                }
                
                Section("Tomorrow") {
                    HStack {
                        Text("Fajr")
                        Spacer()
                        Text("03:00")
                    }
                    .foregroundColor(.secondary)
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
