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
                .foregroundColor(Color(hex: "CE4711"))
            
            HStack(spacing: 2) {
                ForEach(0..<item.rating) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(hex: "FCB814"))
                }
                ForEach(item.rating..<5) { _ in
                    Image(systemName: "star")
                        .foregroundColor(Color(hex: "FCB814"))
                }
            }
        }
        .padding()
        .background(Color(hex:"FEEAB8"))
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
                .stroke(Color(hex: "FEEAB8"), lineWidth: 2) //search bar outline
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
    FoodItem(name: "Embassy Cafe", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142595695480935/image.png?ex=66d35de0&is=66d20c60&hm=59a12e2e8b5a949eab19a665eebd4b05d1301785498dc2674676bbac077bde4d&=&format=webp&quality=lossless&width=700&height=492", rating: 5),
    FoodItem(name: "The Hardware Societe", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142618680262706/image.png?ex=66d35de5&is=66d20c65&hm=7c27e2aad990d1f9fafe393c077b163659b69482e060f5e93ee5c5eff35bd083&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
]

let lunchItems = [
    FoodItem(name: "Kim Soju", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142650318028821/image.png?ex=66d35ded&is=66d20c6d&hm=0fa59747abf11406ed4d24e0cf6ec341dc3292d6fcb13c251492b783027fdeff&=&format=webp&quality=lossless&width=700&height=492", rating: 4),
    FoodItem(name: "Udon Izakaya Maedaya", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142705120808971/image.png?ex=66d35dfa&is=66d20c7a&hm=7a171cf60e6e4170ac7748a39668d89c56688ce25bc1222110cd04108dfd6040&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
]

let dinnerItems = [
    FoodItem(name: "ABC Chicken", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142936508104797/image.png?ex=66d35e31&is=66d20cb1&hm=34ed708f53ec25543fcd10b28a11a1d38d978a4f292259e3a8877ab825968061&=&format=webp&quality=lossless&width=700&height=492", rating: 4),
    FoodItem(name: "El Rincon", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142960377630720/image.png?ex=66d35e37&is=66d20cb7&hm=0ff40a9b06b02c84a0ab60450fede2211c39fc2b2f072d92fa3450ce7fe6f48e&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
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
