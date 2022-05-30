//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

let columns:[GridItem] = [GridItem(), GridItem(), GridItem(), GridItem()]

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black)
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .padding()
                }
                LazyVGrid(columns: columns){
                     ForEach(allButtonsArray){ item in
                         ButtonUIView(buttonModel:item)
                     }
                }
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height:50)
            }
         }
         .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
