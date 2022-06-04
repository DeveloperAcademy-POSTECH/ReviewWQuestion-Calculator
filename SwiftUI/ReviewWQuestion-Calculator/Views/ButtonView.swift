//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var expression: ExpressionModel
    var color: Color
    var button: String

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Button(action: execute) {
                    Circle()
                        .foregroundColor(color)
                }
                    Text(button)
                        .font(.system(size: geo.size.width < geo.size.height
                                      ? geo.size.width * 0.6
                                      : geo.size.height * 0.6))
                        .foregroundColor(color != Color.funcButton ? .white : .black)
            }
        }
    }

    func execute() {
        switch button {
        case "0"..."9":
            if expression.output != nil {
                expression.left = button
            } else if expression.oper != nil {
                expression.append_right(button)
            } else {
                expression.append_left(button)
                print(expression.left ?? "Nothing")
            }
        case "÷", "×", "−", "+":
            if expression.right != nil {
                expression.left = expression.doOperate(button)
            }
            expression.oper = button
        case "=":
            if expression.output != nil {
                expression.left = expression.output
            }
            expression.output = expression.doOperate(expression.oper!)
        case ".":
            if expression.right != nil {
                if expression.right?.contains(".") == false {
                    expression.append_right(".")
                }
            } else if expression.oper != nil {
                expression.right = ".0"
            } else if expression.left != nil {
                if expression.left?.contains(".") == false {
                    expression.append_left(".")
                }
            }
        case "C":
            expression.clear()
        case "AC":
            expression.allclear()
        default:
            ()
        }
    }
}
