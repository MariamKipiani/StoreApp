//
//  MainView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView()
                CardBalanceView()
                CategoryScrollView()
                    .padding(.leading, -10)
                verticalScrollView
            }
            .padding(EdgeInsets(top: 20, leading: 22, bottom: 20, trailing: 22))
            .background(Color("Background"))
            .navigationBarTitle("Explore", displayMode: .inline) 
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var verticalScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            productsGrid
        }
        .background(Color("Background"))
    }

    private var productsGrid: some View {
        LazyVGrid(columns: viewModel.gridLayout, spacing: 15, content: {
            ForEach(viewModel.products) { product in
                productsLink(product)
            }
        })
        .alert(isPresented: $viewModel.isCheckoutSuccessful) {
            Alert(
                title: Text("Success"),
                message: Text("You have successfully bought the items. ✅"),
                dismissButton: .default(Text("OK")) {
                    viewModel.isCheckoutSuccessful = false
                }
            )
        }
    }

    private func productsLink(_ product: Product) -> some View {
        NavigationLink(destination: DetailPageView(product: product)) {
            ProductCardView(product: product)
        }
    }
}

// Adjust the preview to match the design
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .environmentObject(MainViewModel())
        }
    }
}

