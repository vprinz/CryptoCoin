//
//  NavigationTestView.swift
//  CryptoCoin
//
//  Created by Valerie N. Prinz on 28/08/2024.
//

import SwiftUI

struct NavigationTestView: View {
    
    var pathNum: Int
    
    var body: some View {
        Text("Hello World! \(pathNum)")
    }
}

#Preview {
    NavigationTestView(pathNum: 1)
}
