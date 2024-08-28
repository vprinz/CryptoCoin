//
//  CoinDetailView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

struct CoinDetailView: View {
    
    @Environment(CoinModel.self) var coinModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(coinModel.selectedCoin?.name ?? "")
                .font(.largeTitle)
            Text("Current Price: \(String(format: "%.2f", coinModel.selectedCoin?.currentPrice ?? 0)) rub.")
        }
        .environmentObject(Coordinator())
    }
}

#Preview {
    CoinDetailView()
        .environment(CoinModel())
}
