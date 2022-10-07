//
//  Producer.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import Foundation


struct Producer: Identifiable, Hashable {
    let id: Int
    var name: String
    var address: String
    var email: String?
    var phone: String?
    var about: String?
    
}

extension Producer {
    static let demoData = Producer(id: 1, name: "Hidden Flavours", address: "Guadalmansa 33, junto al río")
}
