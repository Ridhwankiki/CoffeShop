//
//  ContentView.swift
//  CoffeShop
//
//  Created by MacBook Pro on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var coffeeshops: [Coffeeshop] = CoffeeshopProvider.allData()
    
    @State private var searchText: String = ""
    @State private var isRedacted: Bool = true
    
    var coffeeshopSearchResults: [Coffeeshop] {
        guard !searchText.isEmpty else {
            return coffeeshops
        }
//        return emojis.filter { $0.name.lowercased().contains(searchText.lowercased())
        return coffeeshops.filter { $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List(coffeeshopSearchResults) { coffeeshop in
                NavigationLink {
                    CoffeeShopDetail(coffeeshop: coffeeshop)
                } label: {
                    if isRedacted {
                        CoffeeShopRow(coffeeshop: coffeeshop)
                            .redacted(reason: .placeholder)
                    } else {
                        CoffeeShopRow(coffeeshop: coffeeshop)
                    }
                }
            }
            .navigationTitle("Coffeshop")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isRedacted = false
            }
        }
        .overlay {
            if coffeeshopSearchResults.isEmpty {
                ContentUnavailableView.search(text: searchText)
            }
        }
    }
}

#Preview {
    ContentView()
}
