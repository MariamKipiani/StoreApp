//
//  CardBalanceView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct CardBalanceView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            CardBackgroundView()
            CardContentView()
        }
        .frame(maxHeight: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.white)
    }
}

struct CardBackgroundView: View {
    var body: some View {
        Color.black
    }
}

struct CardContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            BalanceHeaderView()
            Spacer()
            BalanceAmountView()
            Spacer()
            TotalSpentView()
            Spacer()
        }
        .padding()
    }
}

struct BalanceHeaderView: View {
    var body: some View {
        Text("Balance")
            .font(.title3)
    }
}

struct BalanceAmountView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        Text(String(format: "$%.2f", viewModel.balance))
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(viewModel.error != nil ? .red : .white)
    }
}

struct TotalSpentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total Spent:")
                    .font(.title3)
                    .foregroundColor(.black)
                
                Text(String(format: "$%.2f", viewModel.totalSpent))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            Spacer()

            Button(action: {
                viewModel.checkout()
            }) {
                Text("Check Out")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 40)
                    .background(viewModel.cartItems.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(10)
            }
            .disabled(viewModel.cartItems.isEmpty)
        }
        .padding()
        .background(Color(red: 250/255, green: 246/255, blue: 240/255))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// Other Views

// Preview
struct CardBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        CardBalanceView()
            .environmentObject(MainViewModel())
            .preferredColorScheme(.light)
    }
}

