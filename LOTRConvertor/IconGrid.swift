//
//  IconGrid.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 03/08/1447 AH.
//
import SwiftUI

struct IconGrid: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var currency: Currency
    
    var onSelect: (Currency) -> Void
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIcon(
                        currencyName: currency.id.name,
                        currencyImage: currency.id.image
                    ).shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25).stroke(
                                lineWidth: 3
                            ).opacity(0.5)
                        }
                } else {
                    CurrencyIcon(
                        currencyName: currency.id.name,
                        currencyImage: currency.id.image
                    ).onTapGesture {
                        print("Selected now is : \(currency.name)")
                        self.currency = currency
                        self.onSelect(currency)
                    }
                }
                
            }
            
        }
        
    }
}

//#Preview {
//    @Previewable @State var currency: Currency = .copperPenny
//    IconGrid(
//        currency: $currency
//        onSelect:
//    )
//}
