//
//  currencyGrid.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 18/5/2023.
//

import SwiftUI

struct currencyGrid: View {
    @Binding var currency : Currency
    @State var gridlayout = [GridItem(), GridItem(), GridItem()]
    var body: some View {
        LazyVGrid(columns: gridlayout){
            ForEach(0..<5){ i in
                if Currency.allCases[i] == currency{
                    CurrencyIcon(iconImage: CurrencyImage.allCases[i].rawValue, iconText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.white)
                            .opacity(0.75))
                        .shadow(color: .black, radius: 11)
                }
                else{
                    CurrencyIcon(iconImage: CurrencyImage.allCases[i].rawValue, iconText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                            .opacity(0.75))
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
               
                    
            }
        }

    }
}

struct currencyGrid_Previews: PreviewProvider {
    static var previews: some View {
        currencyGrid(currency: .constant(.silverPenny))
    }
}
