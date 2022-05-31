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
                    Text("\(resultNumberClass.resultNumber)")
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .font(resultNumberClass.resultNumber/1000 < 5 ? .system(size: 90) : .system(size: 50))
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
