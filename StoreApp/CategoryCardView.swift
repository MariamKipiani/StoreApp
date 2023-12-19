//
//  CategoryCardView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct CategoryCardView: View {
    var categoryName: String
    var categoryIcon: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: categoryIcon)
                .font(.title2)
                .foregroundColor(.blue) // Updated fill color
            
            Spacer().frame(height: 4)
            
            Text(categoryName)
                .font(.caption)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.vertical, 20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.blue, lineWidth: 2)) // Updated stroke color
    }
}

struct CategoryScrollView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryCardView(categoryName: category.rawValue.capitalized, categoryIcon: category.iconName)
                        .onTapGesture {
                            viewModel.selectCategory(category)
                        }
                }
            }
            .padding(.horizontal)
        }
        .background(Color("Background"))
    }
}

extension Category {
    var iconName: String {
        switch self {
        case .all:
            return "tray.2.fill"
        case .smartphones:
            return "phone.fill"
        case .laptops:
            return "laptopcomputer"
        case .fragrances:
            return "flame.fill"
        case .skincare:
            return "leaf.fill"
        case .groceries:
            return "cart.fill"
        case .homeDecoration:
            return "house.fill"
        }
    }
}

// Preview
struct CategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScrollView()
            .environmentObject(MainViewModel())
            .preferredColorScheme(.light)
    }
}

