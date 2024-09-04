//
//  CoinDetailView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 25/07/2024.
//

import SwiftUI

// FIXME: Move to a separate file
class CoinDetailViewModel: Equatable {
    let selectedCoin: Coin
    
    init(selectedCoin: Coin) {
        self.selectedCoin = selectedCoin
    }
    
    static func == (lhs: CoinDetailViewModel, rhs: CoinDetailViewModel) -> Bool {
        lhs.selectedCoin.id == rhs.selectedCoin.id
    }
}

struct CoinDetailView: View {
    
    @State var coinModel: CoinDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(coinModel.selectedCoin.name)
                .font(.largeTitle)
            Text("Current Price: \(String(format: "%.2f", coinModel.selectedCoin.currentPrice)) rub.")
        }
    }
}

#Preview {
    CoinDetailView(coinModel: CoinDetailViewModel(selectedCoin: .init(id: "", name: "test", currentPrice: 12.34)))
}
