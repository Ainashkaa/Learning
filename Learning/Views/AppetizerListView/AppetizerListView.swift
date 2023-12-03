//
//  AppetizerListView.swift
//  Learning
//
//  Created by Ainash Turbayeva on 20.11.2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerViewModel()
    @State private var showAlert = false
    @State private var isShowingDetailView = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack{
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    Button(action: {
                        self.selectedAppetizer = appetizer
                        self.isShowingDetailView = true
                    }) {
                        AppetizerView(appetizer: appetizer)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Appetizer List View")
                
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .onChange(of: viewModel.alertItem) { newAlertItem in
                showAlert = newAlertItem != nil
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            }
        }
        .alert("Server Error", isPresented: $showAlert, presenting: viewModel.alertItem) {
            alertItem in Button ("OK") {}
        } message: { alertItem in
            alertItem.message
        }
    }
}


#Preview {
    AppetizerListView()
}
