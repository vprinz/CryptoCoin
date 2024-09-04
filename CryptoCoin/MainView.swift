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
            Button("Get data by Async/Await") {
                coinModel.getCoinListByAsync()
            }
            .padding()
            
            Button("Get data by Closures") {
                coinModel.getCoinListByClosure()
            }
            .padding()
            
            Button("Get data by Combine") {
                coinModel.getCoinListByCombine()
            }
            .padding()
        }
        .disabled(!coinModel.coinList.isEmpty)
        
        Button("Clean the List") {
            coinModel.coinList = [Coin]()
        }
        .disabled(coinModel.coinList.isEmpty)
        .foregroundStyle(coinModel.coinList.isEmpty ? .gray : .red)
        .onChange(of: coinModel.detailViewModel, { _, newValue in
            guard let newValue else { return }
            coordinator.present(sheet: .coinDetail(viewModel: newValue))
        })
        .padding()
        
        list
            .padding()
    }
    
    var list: some View {
        VStack {
            List(coinModel.coinList) { coin in
                Text(coin.name)
                    .onTapGesture {
                        coinModel.didSelectCoin(byId: coin.id)
                    }
            }
            .listStyle(.plain)
        }
    }
}
