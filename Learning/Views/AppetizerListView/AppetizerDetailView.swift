//
//  DetailView.swift
//  Learning
//
//  Created by Ainash Turbayeva on 29.11.2023.
//

import SwiftUI

struct DetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //            AppetizerRemoteImage(urlString: appetizer.imageURL)
                Image("asian-flank-steak")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack(spacing: 25) {
                        NutritionFactView(label: "Calories", value: "\(appetizer.calories)")
                        NutritionFactView(label: "Carbs", value: "\(appetizer.carbs)")
                        NutritionFactView(label: "Protein", value: "\(appetizer.protein)")
                    }
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 250, height: 50)
                        .foregroundStyle(.white)
                        .background(Color("brandPrimary"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom, 30)
                
                
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            print("dismiss")
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
    }
}

struct NutritionFactView: View {
    var label: String
    var value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(label)
                .bold()
                .font(.caption)
            Text(value)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer)
}
