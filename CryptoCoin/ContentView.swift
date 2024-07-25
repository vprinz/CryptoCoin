//
//  ContentView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(CoinModel.self) var coinModel
    
    var body: some View {
        
        @Bindable var coinModel = coinModel
        
        VStack {
            List(coinModel.coinList) { coin in
                Text(coin.name ?? "")
                    .onTapGesture {
                        coinModel.selectedCoin = coin
                    }
            }
            .listStyle(.plain)
        }
        .padding()
        .sheet(item: $coinModel.selectedCoin) { item in
            CoinDetailView()
        }
        .onAppear {
            coinModel.getCoinList()
        }
    }
}

#Preview {
    ContentView()
        .environment(CoinModel())
}
