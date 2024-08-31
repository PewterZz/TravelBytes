//
//  HomeView.swift
//  TravelBytes
//
//  Created by Peter Subrata on 16/8/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var navigateToSearchResults = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    Color(hex: "CE4711")
                    .edgesIgnoringSafeArea(.top)
                        
                    VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                            
                    Text("Hello, Julie!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "FEEAB8"))
                            
                    Text("What are you craving for today?")
                    .font(.title2)
                    .foregroundColor(Color(hex: "FEEAB8"))
                            
                    HStack {
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(hex: "FEEAB8"))
                                
                        CustomPlaceholderTextField(
                            placeholder: Text("Search here").foregroundColor(Color(hex: "FEEAB8")),
                            text: .constant(""))
                                .onTapGesture {
                                    navigateToSearchResults = true
                                }
                                .foregroundColor(Color(hex: "FEEAB8"))
                    }
                    .padding()
                    .background(Color(hex: "E38F5A"))
                    .cornerRadius(10)
                }
                .padding()
            }
            .frame(maxHeight: .infinity)
                    
            SectionView(sectionTitle: "Breakfast", items: breakfastItems)
                    
            SectionView(sectionTitle: "Lunch", items: lunchItems)
                    
            SectionView(sectionTitle: "Dinner", items: dinnerItems)
        }
    }
            .background(Color(hex: "FEEAB8"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .background(
                NavigationLink(destination: SearchResultsView(), isActive: $navigateToSearchResults) {
                    EmptyView()
                }
            )
        }
    }
}

struct CustomPlaceholderTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> Void = { _ in }
    var commit: () -> Void = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
