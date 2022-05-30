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
                HStack{
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                        .padding()
                }
                LazyVGrid(columns: columns){
                     ForEach(allButtonsArray){ item in
                         ButtonUIView(buttonModel:item)
                     }
                }
            }
         }
         .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
