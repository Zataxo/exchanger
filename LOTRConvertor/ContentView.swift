//
//  ContentView.swift
//  LOTRConvertor
//
//  Created by Hassan Abdalla on 22/07/1447 AH.
//

import SwiftUI
import TipKit

struct ContentView: View {

    @State var showExchange: Bool = false

    @State var showSelectCurrency: Bool = false

    @State var leftAmount: String = ""
    @State var rightAmount: String = ""

    @FocusState var leftFocus
    @FocusState var rightFocus

    // This replaces your @State, your UserDefaults.get, AND your initializers!

    //Note : simply use AppStorage
    @AppStorage("from_currency") var leftCurrency: Currency = .goldPenny
    @AppStorage("to_currency") var rightCurrency: Currency = .silverPiece
    //Note : Load via constructor
    //    @State private var leftCurrency: Currency
    //    @State private var rightCurrency: Currency
    //    init() {
    //
    //        let leftRaw = UserDefaults.standard.double(forKey: "from_currency")
    //        let rightRaw = UserDefaults.standard.double(forKey: "to_currency")
    //
    //        print("leftRaw: \(leftRaw)")
    //        print("rightRaw: \(rightRaw)")
    //
    //
    //        _leftCurrency = State(
    //            initialValue: Currency(rawValue: leftRaw) ?? .goldPenny
    //        )
    //        _rightCurrency = State(
    //            initialValue: Currency(rawValue: rightRaw) ?? .silverPiece
    //        )
    //    }

    let currencyTip: CurrencyTip = CurrencyTip()

    @ViewBuilder
    private var equalSection: some View {
        Image(systemName: "equal")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .symbolEffect(.pulse)
    }

    @ViewBuilder
    private var buildInfoButton: some View {
        Button {
            showExchange.toggle()
            print(showExchange)

        } label: {
            Image(systemName: "info.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
        .padding(.trailing)

    }

    var body: some View {

        ZStack {

            Image(.background)
                .resizable()
                .ignoresSafeArea(.all, edges: .all)

            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(Font.largeTitle)
                    .foregroundStyle(Color.white)

                HStack {
                    VStack {

                        HStack {

                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                            Text(leftCurrency.name)
                                .font(.caption)
                                .foregroundStyle(Color.white)

                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .font(.caption)
                            .focused($leftFocus)
                            .onChange(of: leftAmount) {
                                if leftFocus {

                                    rightAmount = leftCurrency.convert(
                                        leftAmount,
                                        to: rightCurrency
                                    )
                                }
                            }

                    }.onTapGesture {
                        showSelectCurrency.toggle()
                        currencyTip.invalidate(reason: .actionPerformed)

                    }
                    equalSection
                    VStack {

                        HStack {

                            Text(rightCurrency.name)
                                .font(Font.caption2)
                                .foregroundStyle(Color.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)

                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }.popoverTip(currencyTip, arrowEdge: .bottom)
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .font(.caption)
                            .focused($rightFocus)
                            .onChange(of: rightAmount) {

                                if rightFocus {

                                    leftAmount = rightCurrency.convert(
                                        rightAmount,
                                        to: leftCurrency
                                    )
                                }
                            }

                    }

                }.popoverTip(currencyTip, arrowEdge: .bottom)

                    .keyboardType(.decimalPad)
                    .padding()
                    .background(.gray.opacity(0.35))
                    //                .clipShape(.capsule.inset(by: 10))
                    .cornerRadius(10)
                    .padding()

                Spacer()

                HStack {
                    Spacer()
                    buildInfoButton
                }

            }.task {
                try? Tips.configure()
            }

            .onChange(of: leftCurrency) {
                leftAmount = leftCurrency.convert(
                    rightAmount,
                    to: leftCurrency
                )

            }.onChange(
                of: rightCurrency,
                {
                    rightAmount = rightCurrency.convert(
                        leftAmount,
                        to: rightCurrency
                    )
                }
            )

            .sheet(isPresented: $showExchange) {
                ExchangeInfoView()
            }.sheet(isPresented: $showSelectCurrency) {
                SelectCurrencyView(
                    fromCurrency: $leftCurrency,
                    toCurrency: $rightCurrency,
                )
            }

        }.onTapGesture {
            if leftFocus || rightFocus {
                DispatchQueue.main.async {
                    self.leftFocus = false
                    self.rightFocus = false
                }
            }
            // or i can just close them directly
            // another way : to dimiss it
            //            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }

    }
}

#Preview {
    ContentView()
}
