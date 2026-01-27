//
//  ExchangeRate.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 03/08/1447 AH.
//
import SwiftUI

struct ExchangeRate: View {
    let leftImg: ImageResource
    let rightImg: ImageResource
    let desc: String
    
    var body: some View {
        HStack {
            Image(self.leftImg)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            
            Text("\(self.desc)")
            
            Image(self.rightImg)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview {
    ExchangeRate(
        leftImg: .goldpiece,
        rightImg: .goldpenny,
        desc: "1 Gold Piece = 4 Gold Pennies"
    )
}
