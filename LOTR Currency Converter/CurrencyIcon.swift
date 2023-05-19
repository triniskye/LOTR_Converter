//
//  CurrencyIcon.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 17/5/2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var iconImage : String
    @State var iconText : String
    var body: some View {
        ZStack{
            //image
            Image(iconImage)
                .resizable()
                .scaledToFit()
            
            //text
            VStack{
                Spacer()
                Text(iconText)
                    .background(.brown.opacity(0.75))
                    .font(.caption)
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(iconImage: "copperpenny", iconText: "copper penny")
    }
}
