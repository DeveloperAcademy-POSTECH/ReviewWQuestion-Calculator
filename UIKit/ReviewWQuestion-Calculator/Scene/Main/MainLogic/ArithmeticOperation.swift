//
//  ArithmeticOperation.swift
//  ReviewWQuestion-Calculator
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

struct ArithmeticOperation {
    var leftPort: Double = 0
    var rightPort: Double?
    var operation: Operation?

    // 좌항,우항 입력
    mutating func inputNum(_ num: Double) {
        if operation != nil {
            self.rightPort = num
            self.leftPort = self.operate()
            self.rightPort = nil
        } else {
            self.leftPort = num
        }
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
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
    case progress
}
