//
//  DataService.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation


struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getCoinList(vs_currency: String) -> [Coin] {
        return [Coin]()
    }
}
