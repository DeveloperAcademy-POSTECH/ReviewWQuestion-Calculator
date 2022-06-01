//
//  calculateData.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/31.
//

import Foundation

class calculateData: ObservableObject {
    
    @Published var calculSequence: [String] = []
    @Published var resultSequence: [Float] = []
    @Published var result: Float = 0
    @Published var iscalculated: Bool = false
    @Published var resultProcessed: String = ""
    // .이 있다고 보여지나(?) 어디서 짤라야하지(?) 닷이 있으면 짜르지말고, 닷이 없으면 짜르자, -> 나눗셈(?)
    
    func calculate(_ a: Float,_ b: Float,_ calculation: String) -> Float{
        switch calculation {
        case "+":
            return a + b
        case "-":
            return a - b
        case "×":
            return a * b
        case "÷":
            if b == 0 {
                return 3.141592
            } else {
            return a / b
            }
        default:
            return a + b
        }
    }
    
    func isProcessed() -> String {
        let resultString: String = "\(result)"

        if result == Float(Int(result)) {
            if let index = resultString.firstIndex(of: ".") {
                resultProcessed = String(resultString[..<index])
            }
        } else {
           resultProcessed = String(result)
        }
        
        return resultProcessed
    }
//    func plus(_ a: Float, _ b: Float) -> Float {
//        return a + b
//    }
//
//    func minus(_ a: Float, _ b: Float) -> Float {
//        return a - b
//    }
//
//    func multiply(_ a: Float, _ b: Float) -> Float {
//        return a * b
//    }
//
//    func divide(_ a: Float, _ b: Float) -> Float {
//        return a / b
//    }
}



class operationData: ObservableObject {
    @Published var operationIsActive: [Bool] = [false,false,false,false]
    
    func operationReset() {
        self.operationIsActive = [false,false,false,false]
    }
}


