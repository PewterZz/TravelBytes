//
//  SearchResultsView.swift
//  TravelBytes
//
//  Created by Peter Subrata on 31/8/2024.
//

import SwiftUI

struct SearchResultsView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hello, Julie")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "FEEAB8"))
                
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(hex: "FEEAB8"))
                        .font(.title)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .background(Color(hex: "CE4711"))
                        
            Text("What are you craving for today?")
            .font(.title2)
            .foregroundColor(Color(hex: "FEEAB8"))
            .padding([.leading, .bottom])
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "FEEAB8"))
                
                CustomPlaceholderTextField(
                    placeholder: Text("Search here").foregroundColor(Color(hex: "FEEAB8")),
                    text: $searchText)
                        .foregroundColor(Color(hex: "FEEAB8"))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "FEEAB8"), lineWidth: 2)
                .background(Color(hex: "CE4711"))
            )
            .cornerRadius(10)
            .padding(.horizontal)
            
            Text("RECENT")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "FEEAB8"))
                .padding([.leading, .top])
            
            List {
                ForEach(filteredSearchResults, id: \.id) { item in
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.yellow)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(Color(hex: "FEEAB8"))
                            
                            
                            Text(item.address)
                                .font(.subheadline)
                                .foregroundColor(Color(hex: "FEEAB8"))
                            
                            HStack {
                                Text(item.status)
                                    .foregroundColor(item.isOpen ? Color(hex: "B4D829") : Color(hex: "FCB814"))
                                Text("Opens \(item.opensAt)")
                                    .foregroundColor(Color(hex: "FEEAB8"))
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color(hex: "CE4711"))
                    .cornerRadius(10)
                }
                .listRowBackground(Color(hex: "CE4711"))
            }
            .listStyle(PlainListStyle())
            .background(Color(hex: "CE4711"))
        }
        .background(Color(hex: "CE4711"))
        .ignoresSafeArea(edges: .bottom)
    }
    
    var filteredSearchResults: [RecentSearchItem] {
        if searchText.isEmpty {
            return recentSearches
        } else {
            return recentSearches.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
