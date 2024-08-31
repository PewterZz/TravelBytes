//
//  data.swift
//  TravelBytes
//
//  Created by Peter Subrata on 31/8/2024.
//

import Foundation

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
