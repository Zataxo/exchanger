//
//  Currency.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 03/08/1447 AH.
//
import SwiftUI

enum Currency: String, CaseIterable, Identifiable {
    
    case copperPenny
    case silverPenny
    case silverPiece
    case goldPenny
    case goldPiece
    
    var id: Currency { self }
    
    var multiplier: Double {
        switch self {
        case .copperPenny: return 6400
        case .silverPenny: return 64
        case .silverPiece: return 16
        case .goldPenny: return 4
        case .goldPiece: return 1
        }
    }
    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperpenny
        case .silverPenny:
            return .silverpenny
        case .silverPiece:
            return .silverpiece
        case .goldPenny:
            return .goldpenny
        case .goldPiece:
            return .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
    
    func convert(_ amount: String, to currency: Currency) -> String {
        guard !amount.isEmpty else { return "Amount is Empty" }
        guard let amountDouble = Double(amount) else {
            return "Invalid amount"
        }
        
        let converted =
        (amountDouble / self.multiplier) * currency.multiplier
        return String(format: "%.2f", converted)
    }
    
}
