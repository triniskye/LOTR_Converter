//
//  ExchangeInfo.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 17/5/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            //paper background
            Image("parchment")
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            
            VStack{
                //title
                Text("Exchange Rates")
                    .font(.largeTitle)
                //body
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                //exchange rates
                
                //one
                ExchangeRate(leftImageFile: "goldpiece", rightImageFile: "goldpenny", conversionRate: "1 Gold Piece = 4 Gold Pennies")
                //two
                ExchangeRate(leftImageFile: "goldpenny", rightImageFile: "silverpiece", conversionRate: "1 Gold Penny = 4 Silver Pieces")
                //three
                ExchangeRate(leftImageFile: "silverpiece", rightImageFile: "silverpenny", conversionRate: "1 Silver Piece = 4 Silver Pennies")
                //four
                ExchangeRate(leftImageFile: "silverpenny", rightImageFile: "copperpenny", conversionRate: "1 Silver Penny = 100 Copper Pennies")
                
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
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            
    }
}
