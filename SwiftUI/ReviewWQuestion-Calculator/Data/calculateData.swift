//
//  calculateData.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/31.
//

import Foundation

class calculateData: ObservableObject {
    
    @Published var calculSequence: [String] = []
    @Published var resultSequence: [Double] = []
    @Published var result: Double = 0
    @Published var iscalculated: Bool = false
    
    func calculate(_ a: Double,_ b: Double) -> Double{
        switch calculSequence.first {
        case "+":
            return a + b
        case "-":
            return a - b
        case "×":
            return a * b
        case "÷":
            return a / b
        default:
            return a + b
        }
    }
    
//    func plus(_ a: Double, _ b: Double) -> Double {
//        return a + b
//    }
//
//    func minus(_ a: Double, _ b: Double) -> Double {
//        return a - b
//    }
//
//    func multiply(_ a: Double, _ b: Double) -> Double {
//        return a * b
//    }
//
//    func divide(_ a: Double, _ b: Double) -> Double {
//        return a / b
//    }
}



class operationData: ObservableObject {
    @Published var operationIsActive: [Bool] = [false,false,false,false]
    
    func operationReset() {
        self.operationIsActive = [false,false,false,false]
    }
}


