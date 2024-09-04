//
//  DataModel.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation


struct Coin: Identifiable, Decodable, Equatable {
    var id: String
    var name: String
    var currentPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        
        case id
        case name
    }
}
