//
//  DataService.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation


struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getCoinList() async -> [Coin] {
        guard apiKey != nil else {
            return [Coin]()
        }
        
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub") {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let coinList = try decoder.decode([Coin].self, from: data)
                return coinList
            } catch {
                print(error)
            }
        }
        return [Coin]()
    }
}
