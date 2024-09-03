//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation
import SwiftUI
import Combine


@Observable
class CoinModel {
    var coinList = [Coin]()
    var selectedCoin: Coin?
    var dataService = DataService()
    private var cancellables = Set<AnyCancellable>()
    
    func getCoinListByAsync() {
        Task {
            let result = await dataService.getCoinListByAsync()
            switch result {
            case .success(let coins):
                coinList = coins
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCoinListByClosure() {
        dataService.getCoinListByClosure { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coinList = coins
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getCoinListByCombine() {
        dataService.getCoinListByCombine()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { coins in
                self.coinList = coins
            }
            .store(in: &cancellables)
    }
}
