//
//  Model.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/30.
//

import SwiftUI

class CalculatorValue : ObservableObject {
    @Published var outputNumber: Double = 0
    @Published var isDotEntered: Bool = false
    @Published var stored: (oper: String?, num: Int) = (nil, 0)
}

class ButtonModel {
    var str: String
    
    init(_ str: String) {
        self.str = str
    }
}

class OperatorButton: ButtonModel {
}

class NumberButton: ButtonModel {
}

class FuncButton: ButtonModel {
}
