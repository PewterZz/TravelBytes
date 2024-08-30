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
                        Color(red: 0.8, green: 0.4, blue: 0.2)
                            .edgesIgnoringSafeArea(.top)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Spacer()
                            
                            Text("Hello Julie!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("What are you craving for today?")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                                
                                TextField("Search here", text: .constant(""))
                                    .onTapGesture {
                                        navigateToSearchResults = true
                                    }
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.white.opacity(0.3))
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

struct SectionView: View {
    let sectionTitle: String
    let items: [FoodItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
                Spacer()
                
                Button("View all") {

                }
                .foregroundColor(.orange)
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

struct FoodItemView: View {
    let item: FoodItem
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.imageName)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 150, height: 100)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                } else {
                    ProgressView()
                        .frame(height: 100)
                }
            }

            Text(item.name)
                .font(.headline)
                .foregroundColor(.orange)
            
            HStack(spacing: 2) {
                ForEach(0..<item.rating) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                ForEach(item.rating..<5) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .frame(width: 180, height: 200)
        .cornerRadius(10)
    }
}
struct SearchResultsView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hello, Julie")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .padding()
            .background(Color(red: 0.8, green: 0.4, blue: 0.2))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                
                TextField("Search here", text: $searchText)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white.opacity(0.3))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Text("RECENT")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.leading, .top])
            
            List {
                ForEach(filteredSearchResults, id: \.id) { item in
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.yellow)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(item.address)
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                            HStack {
                                Text(item.status)
                                    .foregroundColor(item.isOpen ? .green : .red)
                                Text("Opens \(item.opensAt)")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
            .background(Color(red: 0.8, green: 0.4, blue: 0.2))
        }
        .background(Color(red: 0.8, green: 0.4, blue: 0.2))
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

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let rating: Int
}

struct RecentSearchItem: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let status: String
    let opensAt: String
    let isOpen: Bool
}

let breakfastItems = [
    FoodItem(name: "Embassy Cafe", imageName: "https://www.realcommercial.com.au/news/wp-content/uploads/2023/09/capi_a05a20adbce5a60da324afa37d20e359_4be686411bb04a1b937f314111c5baf2.jpeg", rating: 5),
    FoodItem(name: "The Hardware Societe", imageName: "https://tb-static.uber.com/prod/image-proc/processed_images/ef6466f72b49cc22b05de729bf13a244/fb86662148be855d931b37d6c1e5fcbe.jpeg", rating: 5)
]

let lunchItems = [
    FoodItem(name: "Kim Soju", imageName: "https://whatson.melbourne.vic.gov.au/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaEpJaWt5TURsbFpqSTBaQzAxT1RVMUxUUTVOMlF0WVRSa01DMDJaREkyTVRjMFpqTTVZallHT2daRlZBPT0iLCJleHAiOm51bGwsInB1ciI6ImJsb2JfaWQifX0=--7101e896c08d7d4f21f3ca1fe431fe04a0cb75a4/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDRG9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2REdkeVlYWnBkSGxKSWd0RFpXNTBaWElHT3daVU9oTnlaWE5wZW1WZmRHOWZabWxzYkZzSGFRSndBMmtDVGdJPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--f3876e1fcc2db92cdffea604834734701decf454/ed1fd871-712e-4c99-bb24-6619c48231c1.jpg", rating: 4),
    FoodItem(name: "Udon Izakaya Maedaya", imageName: "https://tb-static.uber.com/prod/image-proc/processed_images/3e980af7491f042db433c5f5e986c428/3ac2b39ad528f8c8c5dc77c59abb683d.jpeg", rating: 5)
]

let dinnerItems = [
    FoodItem(name: "ABC Chicken", imageName: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9SYjDo06V5usuVjEOCVvMhyfaAhvH-lS2Qg&s", rating: 4),
    FoodItem(name: "El Rincon", imageName: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZVQJFwa4HZKap21e2IBpwP_U7hZh2qriVrQ&s", rating: 5)
]

let recentSearches = [
    RecentSearchItem(name: "Kim Soju", address: "408 Queen St, Melbourne VIC 3000", status: "Closed", opensAt: "11.00", isOpen: false),
    RecentSearchItem(name: "Udon Izakaya Maedaya", address: "168-174 Bourke St, Melbourne VIC 3000", status: "Closed", opensAt: "12.00", isOpen: false),
    RecentSearchItem(name: "Embassy Cafe", address: "547 Spencer St, West Melbourne VIC 3003", status: "Open", opensAt: "24 hours", isOpen: true),
    RecentSearchItem(name: "The Hardware Societe", address: "123 Hardware St, Melbourne VIC 3000", status: "Closed", opensAt: "8.00", isOpen: false),
    RecentSearchItem(name: "ABC Chicken", address: "361 Queen St, Melbourne VIC 3000", status: "Open", opensAt: "16.00", isOpen: true),
    RecentSearchItem(name: "El Rincon", address: "69 Victoria St, Melbourne VIC 3000", status: "Closed", opensAt: "9.00", isOpen: false)
]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
