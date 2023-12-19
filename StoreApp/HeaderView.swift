//
//  HeaderView.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewmodel: MainViewModel
    
    var body: some View {
        HStack {
            HStack(alignment: .center) {
                Image(systemName: "applelogo")
                    .font(.system(size: 28))
                Text("iProduct")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            HStack {
                
                ZStack {
                    Color(.white)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Image(systemName: "cart")
                        .font(.system(size: 24))
                        .foregroundStyle(.black)
                }
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(.red)
                        .offset(x: 5, y: 5)
                    
                    Text("\(viewmodel.cartItems.count)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                        .offset(x: 5, y: 5)
                }
                
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color("Background"))
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(MainViewModel())
            .preferredColorScheme(.light)
    }
}

