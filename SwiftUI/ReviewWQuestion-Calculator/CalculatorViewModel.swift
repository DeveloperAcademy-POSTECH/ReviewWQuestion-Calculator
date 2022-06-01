//
//  CalculatorViewModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/31.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var text: String = "0"
    
    var tempOperand: Double = 0
    var tempOperation: String = ""
    var operandStack: [Double] = []
    var operationStack: [String] = []
    // operation Flag
    // display Flag
    
    func input(button: CalculatorButtonManager) {
        switch button {
        case .allClear: // delete top
            text = "0"
        case .reverse: // not implement
            return
        case .percent: // not implement
            return
        case .one, .two, .three, .four, .five,
                .six, .seven, .eight, .nine, .zero, .zero2:
            addToText(number: button.label)
        case .dot:  // dot
            return
        case .minus, .plus, .division, .multiplication:
            operate(operation: button.label)
        case .equal: // result
            return
        }
    }
    
    func addToText(number: String) {
        if text == "0" {
            text = number
        } else {
            text += number
        }
        tempOperand = Double(text) ?? 0
        print(tempOperand)
    }
    
    func operate(operation: String) {
        operandStack.append(Double(text) ?? 0)
        if operation == "plus" {
            tempOperand = Double(text) ?? 0
            
        }
    }
}
