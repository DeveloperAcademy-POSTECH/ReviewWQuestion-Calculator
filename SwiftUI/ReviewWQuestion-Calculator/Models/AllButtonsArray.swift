//
//  AllButtonsArray.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/05/30.
//

import Foundation
import SwiftUI

var allButtonsArray:[ButtonModel] = [
    // 1번째 줄
    ButtonModel(name: "AC", function: "function", color: Color(.lightGray)),
    ButtonModel(name: "±", function: "function", color: Color(.lightGray)),
    ButtonModel(name: "%", function: "function", color: Color(.lightGray)),
    ButtonModel(name: "÷", function: "operator", color: Color(.systemOrange)),
    
    // 2번째 줄
    ButtonModel(name: "7", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "8", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "9", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "×", function: "operator", color: Color(.systemOrange)),
    
    // 3번째 줄
    ButtonModel(name: "4", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "5", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "6", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "-", function: "operator", color: Color(.systemOrange)),
    
    // 4번째 줄
    ButtonModel(name: "1", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "2", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "3", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "+", function: "operator", color: Color(.systemOrange)),
    
    // 5번째 줄
    ButtonModel(name: "0", function: "number", color: Color(.darkGray)),
    ButtonModel(name: "0", function: "number", color: Color(.darkGray)),
    ButtonModel(name: ".", function: "operator", color: Color(.darkGray)),
    ButtonModel(name: "=", function: "operator", color: Color(.systemOrange))
]
