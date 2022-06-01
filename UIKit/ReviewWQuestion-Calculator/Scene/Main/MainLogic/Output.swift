//
//  Output.swift
//  ReviewWQuestion-Calculator
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

struct Output {
    var integerPart: String = ""
    var decimalPart: String?
    var dot: Bool = false
    
    // class를 특정 숫자로 초기화
    mutating func updateWithNum(_ num: Double) {
        if num > floor(num) {
            let integerNum = floor(num)
            let integerText = Int(integerNum).description
            let decimalNum = round( (num - integerNum) * 100) / 100 // 반올림 + 소수점 아래 2자리
            let decimalText = decimalNum.description
            
            self.integerPart = integerText
            dot = true
            let startIndex: String.Index = decimalText.index(decimalText.startIndex, offsetBy: 2)
            self.decimalPart = String(decimalText[startIndex...])
            
        } else {
            self.integerPart = Int(num).description
        }
    }
    
    mutating func getOutputAsNum() -> Double {
        if dot == true {
            // 아무것도 입력안된 상태에 "." 누를경우 소수로 전환
            if self.integerPart == "" {
                self.integerPart = "0"
            }
            guard let decimalPart = self.decimalPart else { return Double(integerPart) ?? 0}
            let outputText = integerPart + "." + decimalPart
            return Double(outputText) ?? 0
            
        } else {
            return Double(integerPart) ?? 0
        }
    }

    mutating func getOutputAsText() -> String {
        if dot == true {
            // 아무것도 입력안된 상태에 "." 누를경우 소수로 전환
            if self.integerPart == "" {
                self.integerPart = "0"
            }
            
            let resultIntegerPart = integerPart.comma()
            var outputText = resultIntegerPart + "."
            guard let decimalPart = self.decimalPart else { return outputText }
            outputText += decimalPart
            return outputText
            
        } else {
            let resultIntegerPart = integerPart.comma()
            return resultIntegerPart
        }
    }
    
    // Text 입력
    mutating func textInput(_ input: String) {
        if dot == true {
            guard var _ = self.decimalPart else {
                self.decimalPart = input
                return
            }
            self.decimalPart! += input
        } else {
            integerPart += input
        }
    }
}
