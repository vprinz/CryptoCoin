//
//  DataService.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation


struct DataService {
    
    func getCoinListByAsync() async -> Result<[Coin], Error> {
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub") {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let coinList = try decoder.decode([Coin].self, from: data)
                return .success(coinList)
            } catch {
                return .failure(error)
            }
        }
        return .failure(URLError(.badURL))
    }
}
