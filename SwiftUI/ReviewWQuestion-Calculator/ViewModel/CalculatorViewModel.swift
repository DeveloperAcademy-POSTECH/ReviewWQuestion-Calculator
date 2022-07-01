//
//  CalculatorViewModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/31.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var text: String = "0"
    
    let zero: String = "0"
    var operands: [Double] = []
    var tempOperand: Double = 0
    var operations: [String] = []
    var tempOperation = ""
    var isOperation = false
    var isEqual = false
    
    func input(button: CalculatorButtonType) {
        switch button {
        case .allClear:
            inputAllClear()
        case .reverse: // no
            return
        case .percent: // no
            return
        case .one, .two, .three, .four, .five,
                .six, .seven, .eight, .nine, .zero, .zero2:
            addNumberText(button.label)
        case .dot:
            addDot()
        case .minus, .plus, .division, .multiplication:
            operate(operation: button.label)
        case .equal:
            text = inputEqual()
        }
    }
    
    private func addNumberText(_ numberText: String) {
        if isEqual {
            isEqual = false
            text = zero
        }
        if isOperation {
            isOperation = false
            operands.append(tempOperand)
            operations.append(tempOperation)
            text = zero
        }
        if checkNumberCount() {
            if text == zero {
                text = numberText
            } else {
                text += numberText
            }
        }
    }
    
    private func addDot() {
        if isEqual {
            isEqual = false
            text = "0."
        }
        if isOperation {
            isOperation = false
            operands.append(tempOperand)
            operations.append(tempOperation)
            text = "0."
        }
        if checkNumberCount() {
            if text.contains(".") {
                
            } else {
                text += "."
            }
        }
    }
    
    private func operate(operation: String) {
        isOperation = true
        switch operation {
        case "plus", "minus" :
            tempOperation = operation //plus, minus 이전 연산은 무조건 처리
            guard let temp = Double(text) else { return }
            tempOperand = temp
            // mul, div 이전 연
        case "multiply", "divide" :
            tempOperation = operation
            guard let temp = Double(text) else { return }
            tempOperand = temp
        default : return
        }
    }
    
    private func inputEqual() -> String {
        var result = Double(text)!
        if result == 0 && tempOperation == "divide" {
            return "Error"
        }
        isEqual = true
        while !operations.isEmpty {
            tempOperand = operands.popLast()!
            tempOperation = operations.popLast()!
            
            switch tempOperation {
            case "plus":
                result = tempOperand + result
            case "minus":
                result = tempOperand - result
            case "multiply":
                result = tempOperand * result
            case "divide":
                result = tempOperand / result
            default: return "Error"
            }
        }
        return result != Double(Int(result)) ? "\(result)" : "\(Int(result))"
    }
    
    private func inputAllClear() {
        
        isOperation = false
        if text != zero {
            text = zero
        } else {
            operands.removeAll()
            operations.removeAll()
        }
    }
    
    private func checkNumberCount() -> Bool {
        var count = 0
        
        for index in text {
            if index >= "0" && index <= "9" {
                count += 1
            }
        }
        return count != 9
    }
}
