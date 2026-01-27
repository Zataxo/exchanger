//
//  Untitled.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 06/08/1447 AH.
//

import TipKit

struct CurrencyTip :Tip{
    var title: Text {
        Text("Change Currency")
    }
    
    var message: Text? {
        Text("Select your preferred currency, you can switch both ways.")
    }
    
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
}
