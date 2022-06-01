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
                ButtonView(color: Color.funcButton, button: "C")
                ButtonView(color: Color.funcButton, button: "±")
                ButtonView(color: Color.funcButton, button: "%")
                ButtonView(color: Color.operatorButton, button: "÷")
            }
            HStack {
                ButtonView(color: Color.digitButton, button: "7")
                ButtonView(color: Color.digitButton, button: "8")
                ButtonView(color: Color.digitButton, button: "9")
                ButtonView(color: Color.operatorButton, button: "×")
            }
            HStack {
                ButtonView(color: Color.digitButton, button: "4")
                ButtonView(color: Color.digitButton, button: "5")
                ButtonView(color: Color.digitButton, button: "6")
                ButtonView(color: Color.operatorButton, button: "−")
            }
            HStack {
                ButtonView(color: Color.digitButton, button: "1")
                ButtonView(color: Color.digitButton, button: "2")
                ButtonView(color: Color.digitButton, button: "3")
                ButtonView(color: Color.operatorButton, button: "+")
            }
            HStack {
                ButtonView(color: Color.digitButton, button: "")
                ButtonView(color: Color.digitButton, button: "0")
                ButtonView(color: Color.digitButton, button: ".")
                ButtonView(color: Color.operatorButton, button: "=")
            }
        }
    }
}

//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView().background(.black)
//    }
//}
