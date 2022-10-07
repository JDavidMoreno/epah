//
//  Product.swift
//  Epah
//
//  Created by David Moreno on 7/10/22.
//

import Foundation



struct Product: Identifiable, Hashable {
    let id: Int
    var name: String
    var description: String
    var categories: [ProductCategory]
    var price: Double
    
}
