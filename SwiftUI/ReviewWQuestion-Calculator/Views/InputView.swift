//
//  InputView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct InputView: View {
    @Binding var number: Double
    
    var body: some View {
        VStack {
            HStack {
                ButtonView(number: $number, color: Color.funcButton, text: "C")
                ButtonView(number: $number, color: Color.funcButton, text: "±")
                ButtonView(number: $number, color: Color.funcButton, text: "%")
                ButtonView(number: $number, color: Color.operatorButton, text: "÷")
            }
            HStack {
                ButtonView(number: $number, color: Color.digitButton, text: "7")
                ButtonView(number: $number, color: Color.digitButton, text: "8")
                ButtonView(number: $number, color: Color.digitButton, text: "9")
                ButtonView(number: $number, color: Color.operatorButton, text: "×")
            }
            HStack {
                ButtonView(number: $number, color: Color.digitButton, text: "4")
                ButtonView(number: $number, color: Color.digitButton, text: "5")
                ButtonView(number: $number, color: Color.digitButton, text: "6")
                ButtonView(number: $number, color: Color.operatorButton, text: "−")
            }
            HStack {
                ButtonView(number: $number, color: Color.digitButton, text: "1")
                ButtonView(number: $number, color: Color.digitButton, text: "2")
                ButtonView(number: $number, color: Color.digitButton, text: "3")
                ButtonView(number: $number, color: Color.operatorButton, text: "+")
            }
            HStack {
                ButtonView(number: $number, color: Color.digitButton, text: "")
                ButtonView(number: $number, color: Color.digitButton, text: "0")
                ButtonView(number: $number, color: Color.digitButton, text: ".")
                ButtonView(number: $number, color: Color.operatorButton, text: "=")
            }
        }
    }
}

//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView().background(.black)
//    }
//}
