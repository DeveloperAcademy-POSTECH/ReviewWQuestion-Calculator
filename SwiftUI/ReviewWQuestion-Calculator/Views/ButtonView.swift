//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

func doOperate() {
    
}

struct ButtonView: View {
    @State var isDotEntered: Bool = false
    @Binding var number: Double
    var color: Color
    var text: String
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                Button(action: {
                    switch text {
                    case "0"..."9":
                        if isDotEntered {
                            number = Double(String(number) + String(text))!
                            isDotEntered = false
                        }
                        else {
                            number = number * 10 + Double(text)!
                        }
                    case "÷", "×", "−", "+", "=":
                        doOperate()
                    case ".":
                        isDotEntered = true
                    case "C":
                        number = 0
                    default:
                        ()
                    }
                }) {
                    Circle()
                        .foregroundColor(color)
                }
                Text(text)
                    .font(.system(size: g.size.width < g.size.height ? g.size.width * 0.6 : g.size.height * 0.6))
                    .foregroundColor(color != Color.funcButton ? .white : .black)
            }
        }
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(color: Color.operatorButton, text: "1")
//
//    }
//}
