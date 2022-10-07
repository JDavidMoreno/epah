//
//  Order.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import Foundation


struct Order: Identifiable, Hashable {
    let id: Int
    var name: String
    
}

extension Order {
    static let demoData = [
        Order(id: 1, name: "O2022/00001")
    ]
}
