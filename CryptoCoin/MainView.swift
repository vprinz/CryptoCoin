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
        .onAppear {
            coinModel.getCoinList()
        }
    }
}

#Preview {
    MainView()
        .environment(CoinModel())
}
