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
    
    func getCoinList() {
        Task {
            coinList = await dataService.getCoinList()
        }
    }
}
