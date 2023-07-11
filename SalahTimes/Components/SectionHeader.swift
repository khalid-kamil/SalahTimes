//
//  SectionHeader.swift
//  SalahTimes
//
//  Created by Khalid Kamil on 11/07/2023.
//

import SwiftUI

// MARK: - SectionHeader

struct SectionHeader: View {
  let text: String

  var body: some View {
    Text(text)
      .font(.title3)
      .fontWeight(.semibold)
      .padding(.top)
  }
}

// MARK: - SectionHeader_Previews

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeader(text: "Today")
      .previewDisplayName("Section Header")
      .previewLayout(.sizeThatFits)
      .background(Color(.secondarySystemBackground))
      .padding()
  }
}
