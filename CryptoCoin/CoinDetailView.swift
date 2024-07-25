//
//  CoinDetailView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

struct CoinDetailView: View {
    
    var coin: Coin?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(coin?.name ?? "")
                .font(.largeTitle)
            Text("Current Price: \(String(format: "%.2f", coin?.currentPrice ?? 0)) rub.")
        }
    }
}

#Preview {
    CoinDetailView()
}
