//
//  CalculatorViewModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/31.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var text: String = "0"
    
    func inputNumber(number: CalculatorButtonManager) {
        if text == "0" && number != .dot {
            text = number.label
        } else {
            text += number.label
        }
    }
    
}
