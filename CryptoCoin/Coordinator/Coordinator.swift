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

enum Sheet: String, Identifiable {
    case coinDetail
    
    var id: Self { self }
}


class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
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
        case .coinDetail:
            CoinDetailView()
        }
    }
}
