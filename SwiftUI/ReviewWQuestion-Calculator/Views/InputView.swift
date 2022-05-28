//
//  InputView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        VStack {
            HStack {
                ButtonView(color: Color.funcButton, text: "C")
                ButtonView(color: Color.funcButton, text: "±")
                ButtonView(color: Color.funcButton, text: "%")
                ButtonView(color: Color.operatorButton, text: "÷")
            }
            HStack {
                ButtonView(color: Color.digitButton, text: "7")
                ButtonView(color: Color.digitButton, text: "8")
                ButtonView(color: Color.digitButton, text: "9")
                ButtonView(color: Color.operatorButton, text: "×")
            }
            HStack {
                ButtonView(color: Color.digitButton, text: "4")
                ButtonView(color: Color.digitButton, text: "5")
                ButtonView(color: Color.digitButton, text: "6")
                ButtonView(color: Color.operatorButton, text: "−")
            }
            HStack {
                ButtonView(color: Color.digitButton, text: "1")
                ButtonView(color: Color.digitButton, text: "2")
                ButtonView(color: Color.digitButton, text: "3")
                ButtonView(color: Color.operatorButton, text: "+")
            }
            HStack {
                ButtonView(color: Color.digitButton, text: "0")
                Circle().foregroundColor(.black)
                ButtonView(color: Color.digitButton, text: ".")
                ButtonView(color: Color.operatorButton, text: "=")
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView().background(.black)
    }
}
