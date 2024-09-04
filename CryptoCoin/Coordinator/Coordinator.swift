//
//  Coordinator.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 28/08/2024.
//

import Foundation
import SwiftUI


enum Screen: String, Identifiable {
    case mainView
    
    var id: Self { self }
}

enum Sheet: Identifiable {
    var id: String {
        switch self {
        case .coinDetail(let viewModel):
            return "coinDetail_\(viewModel.selectedCoin.id)"
        }
    }
    
    case coinDetail(viewModel: CoinDetailViewModel)
}


@Observable
class Coordinator {
    var path = NavigationPath()
    var sheet: Sheet?
    
    func push(_ page: Screen) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .mainView:
            MainView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case let .coinDetail(viewModel):
            CoinDetailView(coinModel: viewModel)
        }
    }
}
