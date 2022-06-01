//
//  CalculatorViewModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/31.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var text: String = "0"
    
    var operands: [Double] = []
    var tempOperand: Double = 0
    var operations: [String] = []
    var tempOperation = ""
    var isOperation = false
    // display Flag
    
    func input(button: CalculatorButtonManager) {
        switch button {
        case .allClear:
            inputAllClear()
        case .reverse: // no
            return
        case .percent: // no
            return
        case .one, .two, .three, .four, .five,
                .six, .seven, .eight, .nine, .zero, .zero2:
            addToText(number: button.label)
        case .dot:
            addDot()
        case .minus, .plus, .division, .multiplication:
            operate(operation: button.label)
        case .equal:
            inputEqual()
        }
    }
    
    private func addToText(number: String) {
        if isOperation {
            isOperation = false
            operands.append(tempOperand)
            operations.append(tempOperation)
            text = "0"
        }
        if text == "0" {
            text = number
        } else {
            text += number
        }
    }
    
    private func addDot() {
        if isOperation {
            isOperation = false
            operands.append(tempOperand)
            operations.append(tempOperation)
            text = "0."
        }
        if text.contains(".") {
            
        } else {
            text += "."
        }
    }
    
    private func operate(operation: String) {
        
        /*************** 나중에 업데이트할 내용
            연산 버튼 눌렀을 때 이전에 대한 처리(처리할 것이 있는가)
          --> 있다면(operands에 숫자가 있고 operations에 연산기호가 있다)
               현재 text를 temp operand에 넣고 operands 팝한거랑 오퍼레이션 팝한거 연산
          --> 없다면 temp operand에 현재 text만 넣기
         */
        
        isOperation = true
        switch operation {
        case "plus", "minus" :
            tempOperation = operation //plus, minus 이전 연산은 무조건 처리
            tempOperand = Double(text)!
            // mul, div 이전 연
        case "multiply", "divide" :
            tempOperation = operation
            tempOperand = Double(text)!
        default : return
        }
    }
    
    private func inputEqual() {
        var result = Double(text)!
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
            default: return
            }
        }
        
        text = String(result)
    }
    
    private func inputAllClear() {
        
        if text != "0" {
            text = "0"
        } else {
            operands.removeAll()
            operations.removeAll()
        }
    }
}
