//
//  DataService.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation
import Combine


struct DataService {
    
    let mainUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub"
    
    func getCoinListByAsync() async -> Result<[Coin], Error> {
        guard let url = URL(string: mainUrl) else {
            return .failure(URLError(.badURL))
        }
        
        let request = makeURLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let coinList = try decoder.decode([Coin].self, from: data)
            return .success(coinList)
        } catch {
            return .failure(error)
        }
    }
    
    func getCoinListByClosure(completion: @escaping (Result<[Coin], Error>) -> Void) {
        guard let url = URL(string: mainUrl) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = makeURLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(URLError(.dataNotAllowed)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coinList = try decoder.decode([Coin].self, from: data)
                completion(.success(coinList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getCoinListByCombine() -> AnyPublisher<[Coin], Error> {
        guard let url = URL(string: mainUrl) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let request = makeURLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func makeURLRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        return request
    }
}
