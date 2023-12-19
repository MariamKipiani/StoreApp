//
//  ProductModel.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String?
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}

struct ProductsContainer: Codable, Hashable {
    var products: [Product]
}

struct CartItem {
    var product: Product
    var quantity: Int
}

