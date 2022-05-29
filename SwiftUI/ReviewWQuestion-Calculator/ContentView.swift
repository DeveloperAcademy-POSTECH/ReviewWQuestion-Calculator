//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            VStack {
                Spacer()
                NumberTextView()
                CalculatorButtonView()
            }
            
            .preferredColorScheme(.dark)
            .accentColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
