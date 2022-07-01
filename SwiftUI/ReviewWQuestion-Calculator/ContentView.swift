//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var resultNumberClass:ResultNumber
    let columns:[GridItem] = [GridItem(), GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack{
            Color(.black)
            
            VStack {
                Spacer()
                
                HStack{
                    Spacer()
//                    Text(String(format:"%.f", Double(resultNumberClass.calculatedNumber)!))
                    Text(resultNumberClass.calculatedNumber)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .font(.system(size: 90))
                        .padding()
                }
                
                LazyVGrid(columns: columns){
                     ForEach(allButtonsArray){ button in
                         ButtonUIView(buttonModel:button)
                     }
                }
                
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height:50)
            }
            .padding()
         }
         .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ResultNumber())
            .previewInterfaceOrientation(.portrait)
    }
}
