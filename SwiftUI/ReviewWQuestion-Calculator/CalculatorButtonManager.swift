//
//  CalculatorButtonManager.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

enum CalculatorButtonManager: CaseIterable {
    
    case allClear, reverse, percent, division
    case seven,eight, nine, multiplication
    case four, five, six, minus
    case one, two, three, plus
    case zero, zero2, dot, equal
    
    var label: String {
        switch self {
        case .allClear : return "AC"
        case .reverse : return "plus.forwardslash.minus"
        case .percent : return "percent"
        case .division : return "divide"
        case .seven : return "7"
        case .eight : return "8"
        case .nine : return "9"
        case .multiplication : return "multiply"
        case .four : return "4"
        case .five : return "5"
        case .six : return "6"
        case .minus : return "minus"
        case .one : return "1"
        case .two : return "2"
        case .three : return "3"
        case .plus : return "plus"
        case .zero : return "0"
        case .zero2 : return "0"
        case .dot : return "."
        case .equal : return "equal"
        }
    }
    
    var labelType: String {
        switch self {
        case .reverse, .division, .equal, .minus,
                .multiplication, .percent, .plus : return "systemImage"
        default : return "text"
        }
    }
    
    var labelColor: String {
        switch self {
        case .allClear, .reverse, .percent : return "Black"
        default : return "White"
        }
    }
    
    var background: String {
        switch self {
        case .allClear, .reverse, .percent : return "Gray"
        case .division, .multiplication, .minus, .plus, .equal : return "Orange"
        default : return "DarkGray"
        }
    }
}
