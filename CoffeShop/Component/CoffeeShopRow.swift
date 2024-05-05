//
//  CoffeeShopRow.swift
//  CoffeShop
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct CoffeeShopRow: View {
    var coffeeshop: Coffeeshop
    
    var body: some View {
        HStack {
            Image(coffeeshop.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack (alignment: .leading, spacing: 8){
                Text(coffeeshop.name)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    
                Text(coffeeshop.description)
                    .font(.system(.subheadline, design: .rounded))
                    .lineLimit(2)
                
                Text(coffeeshop.location)
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    CoffeeShopRow(coffeeshop: CoffeeshopProvider.allData().first!)
        .padding()
}
