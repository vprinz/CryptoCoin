//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import Foundation
import SwiftUI


@Observable
class CoinModel {
    var coinList = [Coin]()
    var selectedCoin: Coin?
    var dataService = DataService()
    
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
}
