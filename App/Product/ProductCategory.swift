//
//  ProductCategory.swift
//  Epah
//
//  Created by David Moreno on 7/10/22.
//

import Foundation


enum ProductCategory {
    case vegetable
    case fruit
    case dairy
    case meat
    case honey
    
    var imageName: String {
        switch self {
        case .vegetable:
            return "carrot"
        case .fruit:
            return "leaf"
        case .meat:
            return "hare"
        default:
            return "takeoutbag.and.cup.and.straw"
        }
    }
}
