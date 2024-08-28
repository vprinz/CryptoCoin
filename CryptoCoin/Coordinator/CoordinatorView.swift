//
//  CoordinatorView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 28/08/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screen: .mainView)
                .navigationDestination(for: Screen.self, destination: { screen in
                    coordinator.build(screen: screen)
                })
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .environmentObject(coordinator)
    }
}
