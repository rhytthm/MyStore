//
//  ProductData.swift
//  FakeStore
//
//  Created by Rhytthm on 25/02/23.
//

import Foundation

typealias ProductList = [Product]

// MARK: - Product
struct Product: Decodable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
}

enum Category: String, Decodable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Decodable {
    let rate: Double?
    let count: Int?
}


