//
//  Producer.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import Foundation


struct Producer: Identifiable, Codable {
    let id: UUID
    var name: String
    var address: String
    var email: String?
    var phone: String?
    var about: String?
    
    var latitude: Double
    var longitude: Double
    
    var createdBy: User?
    var user: User?
    
    
    var isConfirmed: Bool {
        user != nil
    }
    
}

extension Producer {
    struct Data {
        var name: String = ""
        var address: String = ""
        var email: String = ""
        var phone: String = ""
        var about: String = ""
    }
    
    var data: Data {
        Data(name: name, address: address, email: email ?? "", phone: phone ?? "", about: about ?? "")
    }
    
    mutating func update(from data: Data) {
        name = data.name
        address = data.address
        email = data.email
        phone = data.phone
        about = data.about
    }
    
    init(fromData data: Data) {
        id = UUID()
        name = data.name
        address = data.address
        phone = data.phone
        about = data.about
    }
}

extension Producer {
    static let sampleData = Producer(id: UUID(), name: "Hidden Flavours", address: "Guadalmansa 33, junto al río")
}
