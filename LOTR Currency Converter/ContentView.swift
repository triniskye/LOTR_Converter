//
//  ContentView.swift
//  LOTR Currency Converter
//
//  Created by Trinity Blanch on 16/5/2023.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency : Currency = .silverPenny
    @State var rightCurrency : Currency = .goldPiece
    @State var showSelectScreen = false
    @State var showInfoScreen = false
    

    
    var body: some View {
        ZStack{
            //background
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                //prancing pony
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                //curreny exchange text
                Text("Currency Converter")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                //conversion section
                HStack{
                    //left conv
                    
                    VStack{
                        //currency
                        HStack{
                            //currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height:35)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    showSelectScreen.toggle()
                                }
                                .sheet(isPresented: $showSelectScreen){
                                    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                                }
                        }
                        .padding(.bottom, -5)
                        //text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp){
                                _ in
                                rightAmount = leftCurrency.convertCurrency(from: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency){
                                _ in
                                leftAmount = rightCurrency.convertCurrency(from: rightAmount, to: leftCurrency)
                            }
                    }
                    //=
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    VStack{
                        HStack{
                            //right conv
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height:35)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    showSelectScreen.toggle()
                                }
                                .sheet(isPresented: $showSelectScreen){
                                    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                                }
                        }
                        .padding(.bottom, -5)
                        //text field
                        TextField("Amount", text: $rightAmount, onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp){
                                _ in
                                leftAmount = rightCurrency.convertCurrency(from: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency){
                                _ in
                                rightAmount = leftCurrency.convertCurrency(from: leftAmount, to: rightCurrency)
                            }
                    }
                    
                    }
                .padding()
                .background(.black .opacity(0.5))
                .cornerRadius(30)
                .padding(.top, 50)
              
                
                Spacer()
                
                //info button
                HStack{
                    Spacer()
                    Button{
                        //information page
                        showInfoScreen.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                           
                        
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showInfoScreen){
                        ExchangeInfo()
                    }
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
