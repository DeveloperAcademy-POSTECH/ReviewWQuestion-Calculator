//
//  Model.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/30.
//

import SwiftUI

class CalculatorModel : ObservableObject {
    @Published var displayOutput: Double = 0
    @Published var isDotEntered: Bool = false
    @Published var stored: (oper: String?, num: Int?) = (nil, nil)
}
