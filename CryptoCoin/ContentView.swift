//
//  ContentView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var coinList = [Coin]()
    @State var selectedCoin: Coin?
    var dataService = DataService()
    
    var body: some View {
        VStack {
            List(coinList) { coin in
                Text(coin.name ?? "")
                    .onTapGesture {
                        selectedCoin = coin
                    }
            }
            .listStyle(.plain)
        }
        .padding()
        .task {
            coinList = await dataService.getCoinList()
        }
        .sheet(item: $selectedCoin) { item in
            CoinDetailView(coin: item)
        }
    }
}

#Preview {
    ContentView()
}
