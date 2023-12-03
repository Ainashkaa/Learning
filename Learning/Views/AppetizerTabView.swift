//
//  AppetizerTabView.swift
//  Learning
//
//  Created by Ainash Turbayeva on 21.11.2023.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label ("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label ("Order", systemImage: "bag")
                }
            
        }
//        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
