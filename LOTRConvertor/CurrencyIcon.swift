//
//  CurrencyIcon.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 03/08/1447 AH.
//
import SwiftUI

struct CurrencyIcon: View {
    let currencyName: String
    let currencyImage: ImageResource
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Image(currencyImage)
                .resizable()
                .frame(height: 100)
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }.padding(3)
            .frame(width: 100)
            .background(.brown)
            .clipShape(.rect(cornerRadius: 25))
        
    }
}

#Preview {
    CurrencyIcon(
        currencyName: "Copper Penny",
        currencyImage: .copperpenny
    )
}
