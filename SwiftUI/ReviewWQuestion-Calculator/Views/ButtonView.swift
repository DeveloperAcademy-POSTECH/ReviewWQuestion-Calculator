//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI


struct ButtonView: View {
    @EnvironmentObject var calculatorValue: CalculatorValue
    var color: Color
    var button: String
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                Button(action: execute) {
                    Circle()
                        .foregroundColor(color)
                }
                Text(button)
                    .font(.system(size: g.size.width < g.size.height ? g.size.width * 0.6 : g.size.height * 0.6))
                    .foregroundColor(color != Color.funcButton ? .white : .black)
            }
        }
    }
    
    func execute() -> Void {
        switch button {
        case "0"..."9":
            print(calculatorValue.isDotEntered)
            if calculatorValue.isDotEntered {
                calculatorValue.outputNumber = Double(String(calculatorValue.outputNumber) + String(button))!
                calculatorValue.isDotEntered = false
            }
            else {
                calculatorValue.outputNumber = calculatorValue.outputNumber * 10 + Double(button)!
            }
        case "÷", "×", "−", "+", "=":
            doOperate()
        case ".":
            calculatorValue.isDotEntered = true
            print("pressed")
        case "C":
            calculatorValue.outputNumber = 0
        default:
            ()
        }
    }
    
    func doOperate() -> Void {
        
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(color: Color.operatorButton, button: "1")
//
//    }
//}
