//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI


struct ButtonView: View {
    @EnvironmentObject var expression: Expression
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
            if expression.output?.isEmpty == false {
                expression.left = button
            }
            else if expression.oper?.isEmpty == false {
                expression.append_right(button)
            }
            else {
                expression.append_left(button)
                print(expression.left ?? "Nothing")
            }
//        case "÷", "×", "−", "+", "=":
//            if expression.right?.isEmpty == false {
//                expression.update_left()
//            }
//            expression.oper = button
//        case ".":
//            calculatorValue.isDotEntered = true
//            print("pressed")
//        case "C":
//            calculatorValue.outputNumber = 0
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
