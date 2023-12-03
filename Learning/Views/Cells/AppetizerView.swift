//
//  AppetizerView.swift
//  Learning
//
//  Created by Ainash Turbayeva on 21.11.2023.
//

import SwiftUI

struct AppetizerView: View {
    let appetizer: Appetizer
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(String(format: "$%.2f", appetizer.price))
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerView(appetizer: MockData.sampleAppetizer)
}
