//
//  CoffeeShopDetail.swift
//  CoffeShop
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct CoffeeShopDetail: View {
    var coffeeshop: Coffeeshop
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CoffeeShopHeader(coffeeshop: coffeeshop)
                
                HStack {
                    VStack (alignment: .leading, spacing: 18) {
                        Text(coffeeshop.overview)
                            .font(.subheadline)
                        
                    }
                    .padding()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement:.topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.title3)
                    }
                    .tint(.primary)
                }
            }
        }
    }
}

#Preview {
    CoffeeShopDetail(coffeeshop: CoffeeshopProvider.allData().first!)
}
