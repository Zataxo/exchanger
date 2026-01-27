//
//  SelectCurrencyView.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 03/08/1447 AH.
//
import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    //TODO : CHANGED TO USE APPSTORAGE THAT AUTO- SYNC DATA
    //    func saveCurrenConfiguration(rawValue: Double, forKey: String) {
    //        UserDefaults.standard.set(rawValue, forKey: forKey)
    //    }
    //
    var body: some View {
        
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                
                Text("Selct the Currency you are starting with : ")
                    .fontWeight(.bold)
                
                IconGrid(
                    currency: $fromCurrency,
                    
                ) { from_Currency in
                    print(
                        "Saving from currency .. is \(from_Currency.rawValue)"
                    )
                    
                    //                    saveCurrenConfiguration(
                    //                        rawValue: fromCurrency.rawValue,
                    //                        forKey: "from_currency"
                    //                    )
                    
                }
                Text("Selct the Currency you would like to convert into :")
                    .fontWeight(.bold)
                    .padding(.top, 10)
                IconGrid(
                    currency: $toCurrency
                ) { to_Currency in
                    print("Saving to currency .. is \(to_Currency.rawValue)")
                    //                    saveCurrenConfiguration(
                    //                        rawValue: toCurrency.rawValue,
                    //                        forKey: "to_currency"
                    //                    )
                    
                }
                
                Button("Done") {
                    
                    dismiss.callAsFunction()
                    
                }
                .buttonStyle(.glassProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                
            }.padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
            
        }.onTapGesture {
            print("Selected Currency is \(self.fromCurrency)")
        }
        
    }
}

#Preview {
    @Previewable @State var fromCurrency: Currency = .silverPenny
    @Previewable @State var toCurrency: Currency = .goldPenny
    SelectCurrencyView(
        fromCurrency: $fromCurrency,
        toCurrency: $toCurrency,
    )
}
