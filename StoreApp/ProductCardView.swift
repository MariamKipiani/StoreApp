//
//  ProductCardView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: product.images.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
            } placeholder: {
                ProgressView()
            }
            
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(height: 40)
                .padding(.horizontal, 8)
            
            Text("Price: $\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.top, 5)
            
            Button(action: {
                viewModel.addToCart(product: product)
            }, label: {
                Text("Add To Cart")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(17)
            })
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}


struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: Product.example)
            .environmentObject(MainViewModel())
            .preferredColorScheme(.light)
    }
}

