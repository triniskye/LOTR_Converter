//
//  ExchangeRate.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 17/5/2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImageFile : String
    @State var rightImageFile = ""
    @State var conversionRate = ""
    var body: some View {
        HStack{
            //left image
            Image(leftImageFile)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            //currency exchange rate info
            Text(conversionRate)
            //right image
            Image(rightImageFile)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImageFile: "goldpenny", rightImageFile: "silverpiece", conversionRate: "1 gold penny = 4 silver coins")
            
    }
}
