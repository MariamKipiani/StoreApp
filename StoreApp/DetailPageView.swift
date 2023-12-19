//
//  DetailPageView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct DetailPageView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var quantity: Int = 0
    var product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(.horizontal)
                } placeholder: {
                    ProgressView()
                        .padding()
                }

                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text(product.brand)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(product.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                            .foregroundColor(index < Int(product.rating) ? .yellow : .gray)
                            .font(.body)
                    }
                }

                Text(String(format: "Price: $%.2f", product.price))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

