//
//  ExchangeInfoView.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 02/08/1447 AH.
//

import SwiftUI

struct ExchangeInfoView: View {

    @Environment(\.dismiss) private var dismiss

    let desc: String =
        "Currency description text involves using symbols ($, €, £) or ISO codes (USD, EUR, GBP) to represent money, placed before or after numbers depending on style (e.g., $100 or 100€). Key elements include the currency name, its three-letter code, and its symbol. "

    @ViewBuilder
    var buildBackgroundHolder: some View {
        Image(.parchment)
            .resizable()
            .ignoresSafeArea()
            .background(.brown)
    }

    var body: some View {
        ZStack {
            buildBackgroundHolder

            VStack {
                Text("Exchange Info")
                    .font(.largeTitle)
                    .tracking(3)
                    .padding(.bottom, 18)

                Text(desc)
                    .font(.title3)

                //                List{
                //
                //                }
                //                .frame(height: 100)
                //                .padding(10)
                //                .background(.red)
                ExchangeRate(
                    leftImg: .goldpiece,
                    rightImg: .goldpenny,
                    desc: "1 Gold Piece = 4 Gold Pennies"
                )
                ExchangeRate(
                    leftImg: .goldpenny,
                    rightImg: .silverpiece,
                    desc: "1 Gold Pennu = 4 Silver Pieces"
                )
                ExchangeRate(
                    leftImg: .silverpiece,
                    rightImg: .silverpenny,
                    desc: "1 Silver Piece = 4 Silver Pennies"
                )
                ExchangeRate(
                    leftImg: .silverpenny,
                    rightImg: .copperpenny,
                    desc: "1 Silver Penny = 100 Cooper Pennies"
                )

                Button("Done") {

                    dismiss.callAsFunction()

                }
                .buttonStyle(.glassProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                //                .controlSize(ControlSize.regular)

            }.padding()
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}
//struct ConversionRow: View {
//    var body: some View {
//        HStack {
//            Image(.goldpiece)
//                .resizable()
//                .scaledToFit()
//                .frame(height: 35)
//
//            Text("1 Gold Piece = 4 Gold Pennies")
//
//            Image(.goldpenny)
//                .resizable()
//                .scaledToFit()
//                .frame(height: 35)
//        }
//    }
//}

// custom style
//struct GlassLikeButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(.horizontal, 24)
//            .padding(.vertical, 12)
//            .background(.thinMaterial)
//            .clipShape(RoundedRectangle(cornerRadius: 14))
//            .scaleEffect(configuration.isPressed ? 0.96 : 1)
//    }
//}
