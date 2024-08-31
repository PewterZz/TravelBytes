//
//  SectionView.swift
//  TravelBytes
//
//  Created by Peter Subrata on 31/8/2024.
//

import SwiftUI

struct SectionView: View {
    let sectionTitle: String
    let items: [FoodItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "CE4711"))
                
                Spacer()
                
                Button("View all") {

                }
                .foregroundColor(Color(hex: "CE4711"))
            }
            .padding([.leading, .trailing])
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(items) { item in
                    FoodItemView(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}
