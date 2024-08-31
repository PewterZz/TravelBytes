//
//  FoodView.swift
//  TravelBytes
//
//  Created by Peter Subrata on 31/8/2024.
//

import SwiftUI

struct FoodView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let imageName: String
    let restoName: String
    let rating: Int
    let descript: String
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Spacer()
                }
                .padding()
                .background(Color(hex: "CE4711"))
                
                ScrollView{
                    VStack{
                        Spacer()
                        
                        AsyncImage(url: URL(string: imageName)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .frame(width: 300, height: 250)
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
                            
                            Text(restoName)
                                .font(.headline)
                                .foregroundColor(Color(hex: "CE4711"))
                            
                            HStack(spacing: 2) {
                                ForEach(0..<rating) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color(hex: "FCB814"))
                                }
                                ForEach(rating..<5) { _ in
                                    Image(systemName: "star")
                                        .foregroundColor(Color(hex: "FCB814"))
                                }
                            }
                            
                            Text(descript)
                                .padding()
                            
                            Button(action: {
                                
                            }) {
                                Text("Show on Map")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 200, height: 40)
                                    .padding()
                                    .background(Color(hex: "CE4711"))
                                    .cornerRadius(10)
                            }
                            .frame(width: 300, height: 40)
                            .background(Color(hex: "CE4711"))
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .background(Color(hex: "FEEAB8"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FoodView(imageName: "https://media.discordapp.net/attachments/1267387405045071912/1279142595695480935/image.png?ex=66d35de0&is=66d20c60&hm=59a12e2e8b5a949eab19a665eebd4b05d1301785498dc2674676bbac077bde4d&=&format=webp&quality=lossless&width=700&height=492", restoName: "Kim Soju", rating: 4, descript: "Kim Soju Restaurant in Melbourne, Victoria, is a hidden gem that offers a unique blend of traditional Korean cuisine with a modern twist. Located in the heart of the city, the restaurant has quickly become a favorite among locals and tourists alike.")
}
