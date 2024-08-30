//
//  BytesView.swift
//  TravelBytes
//
//  Created by Tiffany.W on 31/08/2024.
//

import SwiftUI

struct BytesView: View {
    @State private var navigateToSearchResults = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .center) {
                        Color(hex: "CE4711")
                            .edgesIgnoringSafeArea(.top)
                        
                        VStack(alignment: .center, spacing: 0) {
                            Text("Hello Julie,")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "FEEAB8"))
                            
                            Text("you have 121 Bytes saved!")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "FEEAB8"))
                                Spacer()
    
                            Button(action: {
        
                            }) {
                                Text("+ New list")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: "E38F5A"))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(hex: "E38F5A"), lineWidth: 2)
                                    )
                                    .foregroundColor(Color(hex: "FEEAB8"))
                            }
                            
                            .padding(.top, 10)
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxHeight: .infinity)
                    
                    Section2View(sectionTitle: "Favorite Bytes", items: favoriteBytesItems)
                    
                    Section2View(sectionTitle: "Cheap Bytes", items: cheapBytesItems)
                    
                    Section2View(sectionTitle: "Wish Bytes", items: wishBytesItems)
                }
            }
            .background(Color(hex: "FEEAB8"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
        }
    }
}

struct Section2View: View {
    let sectionTitle: String
    let items: [ByteItem]
    
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
                    FoodItem2View(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FoodItem2View: View {
    let item: ByteItem
    
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


struct ByteItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let rating: Int
}

let favoriteBytesItems = [
    ByteItem(name: "Pork Belly", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279141715831422986/image.png?ex=66d35d0e&is=66d20b8e&hm=4614de8d307ecd042ccf387168d19cc03647d8957dacef1e05a57d60694fe538&=&format=webp&quality=lossless&width=700&height=492", rating: 5),
    ByteItem(name: "Nutella Tiramisu", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279141896786280569/image.png?ex=66d35d39&is=66d20bb9&hm=9e2b803d6fa6a32cbb865754b03f008bfcec6f529740e21181c2c5dcc8e58001&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
]

let cheapBytesItems = [
    ByteItem(name: "Crispy Bacon & Cheese", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142067288670340/image.png?ex=66d35d62&is=66d20be2&hm=41607dfeba4efcc18cdcc4f2bdbfadd72e4a307653d15cede59b4d723df575fe&=&format=webp&quality=lossless&width=700&height=492", rating: 4),
    ByteItem(name: "Chicken Parmigiana", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142092618072074/image.png?ex=66d35d68&is=66d20be8&hm=a321aae7d6e99dd124fd33c61d0fca42a30333544f25bb970cda9976645df5ea&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
]

let wishBytesItems = [
    ByteItem(name: "Chicken Hainan", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142120048951409/image.png?ex=66d35d6e&is=66d20bee&hm=9bf2d65b1a771fef259cff8da3c4f97ba61b6f19a9f631616a3da4f95523bad4&=&format=webp&quality=lossless&width=700&height=492", rating: 4),
    ByteItem(name: "LLAO LLAO Yoghurt", imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142153066647634/image.png?ex=66d35d76&is=66d20bf6&hm=4dbf9f279b8fbab26adf7529af2c88bacae24d11725931068c03f1bb35bd02a7&=&format=webp&quality=lossless&width=700&height=492", rating: 5)
]

// Preview
struct BytesView_Previews: PreviewProvider {
    static var previews: some View {
        BytesView()
    }
}
