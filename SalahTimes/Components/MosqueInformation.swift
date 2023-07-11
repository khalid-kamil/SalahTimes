//
//  MosqueInformation.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 11/07/2023.
//

import SwiftUI

// MARK: - MosqueInformation

struct MosqueInformation: View {
  @Environment(\.dismiss) var dismiss
  let mosqueName: String

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Text("Acton Muslim Welfare Association")
          .foregroundColor(.secondary)
          .padding(.horizontal)
        List {
          Section {
            VStack(alignment: .leading) {
              Text("Phone")
              Link("020 8993 8073", destination: URL(string: "tel:02089938073")!)
            }
          }

          Section {
            VStack(alignment: .leading) {
              Text("Email")
              Link("info@actonmosque.org", destination: URL(string: "mailto:info@actonmosque.org")!)
            }
          }

          Section {
            VStack(alignment: .leading) {
              Text("Facebook")
              Link("facebook.com/ActonMasjid", destination: URL(string: "https://www.facebook.com/ActonMasjid")!)
            }
          }

          Section {
            HStack(alignment: .top) {
              VStack(alignment: .leading) {
                Text("Address")
                Text("2-5 Oldham Terrace, Acton, London W3 6LS")
              }
              Spacer()
              Color.blue
                .frame(width: 100, height: 100)
            }
          }
        }
      }
      .background(Color(.secondarySystemBackground))
      .navigationTitle(mosqueName)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel", role: .cancel) {
            dismiss()
          }
        }
      }
    }
  }
}

// MARK: - MosqueInformation_Previews

struct MosqueInformation_Previews: PreviewProvider {
  static var previews: some View {
    MosqueInformation(mosqueName: "Mosque Name")
  }
}
