//
//  Model.swift
//  Epah
//
//  Created by David Moreno on 7/10/22.
//

import Foundation


class Model: ObservableObject {
    @Published var fetchedProducers: [Producer] = [
        Producer(id: 1, name: "Hidden Flavours", address: "Guadalmansa 33, junto al río"),
        Producer(id: 2, name: "Cocos", address: "Alfarnatejo 46"),
    ]
    
    
    
    
}
