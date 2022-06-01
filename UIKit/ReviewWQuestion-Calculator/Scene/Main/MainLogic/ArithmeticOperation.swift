//
//  ArithmeticOperation.swift
//  ReviewWQuestion-Calculator
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

class ArithmeticOperation {
    var leftPort: Double = 0
    var rightPort: Double?
    var operation: Operation?
    var oldOperation: Operation?

    // 좌항,우항 입력
    func inputNum(_ num: Double) {
        if operation != nil {
            self.rightPort = num
            self.leftPort = self.operate()
            //self.rightPort = nil
        } else {
            self.leftPort = num
        }
    }

    func inputOperation(_ operation: Operation) {
        self.oldOperation = self.operation
        self.operation = operation
    }
    
    // 연산기능 수행
    func operate() -> Double {
        switch operation {
        case .plus:
            return leftPort + rightPort!
        case .minus:
            return leftPort - rightPort!
        case .multiply:
            return leftPort * rightPort!
        case .divide:
            return leftPort / rightPort!
        case .progress:
            return leftPort
        default:
            return 0.0
        }
    }
    
    func operateWithOldOperation() {
        switch oldOperation {
        case .plus:
            leftPort = leftPort + rightPort!
            break
        case .minus:
            leftPort = leftPort - rightPort!
            break
        case .multiply:
            leftPort = leftPort * rightPort!
            break
        case .divide:
            leftPort = leftPort / rightPort!
            break
        case .progress:
            break
        default:
            break
        }
    }
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
    case progress
}
