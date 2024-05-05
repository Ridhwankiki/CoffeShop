//
//  CoffeeShopHeader.swift
//  CoffeShop
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct CoffeeShopHeader: View {
    var coffeeshop: Coffeeshop
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(coffeeshop.image)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(coffeeshop.name)
                        .foregroundStyle(.white)
                    Text(coffeeshop.location)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Image(systemName: "fork.knife.circle.fill")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.orange)
            }
            .padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .background(RandomColor.bgView().opacity(0.5))
            
        }
    }
}

#Preview {
    CoffeeShopHeader(coffeeshop: CoffeeshopProvider.allData().first!)
}
