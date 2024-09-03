//
//  ContentView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

struct MainView: View {
    
    @Environment(CoinModel.self) var coinModel
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        
        @Bindable var coinModel = coinModel
        
        HStack {
            Button("Get data by async/await") {
                coinModel.getCoinListByAsync()
            }
            .padding()
            
            Button("Get data by closures") {
                coinModel.getCoinListByClosure()
            }
            .padding()
            
            Button("Get data by Combine") {
                print("Combine")
            }
            .padding()
        }
        .disabled(!coinModel.coinList.isEmpty)
        
        Button("Clean the List") {
            coinModel.coinList = [Coin]()
        }
        .disabled(coinModel.coinList.isEmpty)
        .foregroundStyle(coinModel.coinList.isEmpty ? .gray : .red)
        .padding()
        
        VStack {
            List(coinModel.coinList) { coin in
                Text(coin.name ?? "")
                    .onTapGesture {
                        coinModel.selectedCoin = coin
                        coordinator.present(sheet: .coinDetail)
                    }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}
