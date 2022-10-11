//
//  User.swift
//  Epah
//
//  Created by David Moreno on 11/10/22.
//

import Foundation


struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String
    
    
}
