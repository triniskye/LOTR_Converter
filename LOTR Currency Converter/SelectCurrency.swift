//
//  SelectCurrency.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 17/5/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency : Currency
    @Binding var rightCurrency : Currency
    @State var gridlayout = [GridItem(), GridItem(), GridItem()]

    
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack{
                //text
                Text("Select the currecny you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                //icon
                                
                currencyGrid(currency: $leftCurrency)
                
                //text
                Text("Select the currecny you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                //icon
                currencyGrid(currency: $rightCurrency)
                
                
                //done button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
                .padding(.top, 50)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))    }
}
