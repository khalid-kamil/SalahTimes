//
//  SectionHeaderView.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 11/07/2023.
//

import SwiftUI

// MARK: - SectionHeaderView

struct SectionHeaderView: View {

  var body: some View {
    HStack(alignment: .bottom) {
      Spacer()
      Text("Adhan".uppercased())
        .padding(.trailing, 8)
      Text("Jama'ah".uppercased())
    }
    .font(.caption)
    .fontWeight(.semibold)
    .foregroundColor(.secondary)
    .padding(.leading)
    .padding(.trailing, 10)
  }
}

// MARK: - SectionHeader_Previews

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeaderView()
      .previewDisplayName("Section Header")
      .previewLayout(.sizeThatFits)
      .background(Color(.secondarySystemBackground))
      .padding()
  }
}
