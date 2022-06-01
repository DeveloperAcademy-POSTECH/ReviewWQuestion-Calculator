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
    var resultNumber: Double = 0
    var operations: [String] = []
    var isOperation = false
    // operation Flag
    // display Flag
    
    func input(button: CalculatorButtonManager) {
        switch button {
        case .allClear: // delete top
            text = "0"
        case .reverse: // no
            return
        case .percent: // no
            return
        case .one, .two, .three, .four, .five,
                .six, .seven, .eight, .nine, .zero, .zero2:
            addToText(number: button.label)
        case .dot:  // dot
            addDot()
        case .minus, .plus, .division, .multiplication:
            operate(operation: button.label)
        case .equal: // result
            return
        }
    }
    
    func addToText(number: String) {
        if isOperation {
            isOperation = false
            operands.append(Double(text) ?? 0)
            text = "0"
        }
        if text == "0" {
            text = number
        } else {
            text += number
        }
    }
    
    func addDot() {
        if isOperation {
            isOperation = false
            operands.append(Double(text) ?? 0)
            text = "0."
        }
        if text.contains(".") {
            
        } else {
            text += "."
        }
    }
    
    func operate(operation: String) {
        //
        //이전 연산에 대한 처리(처리할 것이 있는가)
        //  있다면(operands에 숫자가 있고 operations에 연산기호가 있다)
        //      현재 text를 temp operand에 넣고 operands 팝한거랑 오퍼레이션 팝한거 연산
        //  없다면 temp operand에 현재 text만 넣기
        
        if operation == "plus" {
            isOperation = true
        }
    }
}
