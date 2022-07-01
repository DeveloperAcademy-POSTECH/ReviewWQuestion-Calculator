//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct CalculatorMainView: View {
    
    @StateObject var calculatorViewModel = CalculatorViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                NumberTextView(calculatorViewModel: calculatorViewModel)
                CalculatorButtonView(calculatorViewModel: calculatorViewModel)
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorMainView()
            .previewInterfaceOrientation(.portrait)
    }
}
