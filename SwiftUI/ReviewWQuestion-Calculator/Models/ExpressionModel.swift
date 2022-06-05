//
//  Model.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/30.
//

import SwiftUI

class ExpressionModel: ObservableObject {
    @Published var left: String?
    @Published var oper: String?
    @Published var right: String?
    @Published var output: String?
    let error: String = "오류"

    func append_left(_ num: String) {
        if left != nil {
            if left == "0" {
                left = num
            } else {
                left? += num
            }
        } else if num == "." {
            left = ".0"
        } else {
            left = num
        }
    }

    func append_right(_ num: String) {
        if right != nil {
            if right == "0" {
                right = num
            } else {
                right? += num
            }
        } else if num == "." {
            right = ".0"
        } else {
            right = num
        }
    }

    func clear() {
        if output != nil && output != "0" {
            output = "0"
        } else if right != nil && right != "0" {
            right = "0"
        } else {
            left = "0"
        }
    }

    func allclear() {
        left = nil
        oper = nil
        right = nil
        output = nil
    }

    func doOperate(_ oper: String) -> String {
        let str: String

        switch oper {
        case "+":
            str = String(Double(left!)! + Double(right!)!)
        case "÷":
            guard right != "0" else {
                return error
            }
            str = String(Double(left!)! / Double(right!)!)
        case "×":
            str = String(Double(left!)! * Double(right!)!)
        case "−":
            str = String(Double(left!)! - Double(right!)!)
        default:
            str = ""
        }
        return str
    }

    func display() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        var result: Double = 0
        var endWithDot = false

        if let output = output {
            if output.description.last == "." {
                endWithDot = true
            }
            guard let output = Double(output) else {
                return error
            }
            result = output
        } else if let right = right {
            if right.description.last == "." {
                endWithDot = true
            }
            guard let right = Double(right) else {
                return error
            }
            result = right
        } else if let left = left {
            if left.description.last == "." {
                endWithDot = true
            }
            guard let left = Double(left) else {
                return error
            }
            result = left
        } else {
            result = 0
        }
        guard let result = numberFormatter.string(for: result) else {
            return error
        }
        return result + (endWithDot ? "." : "")
    }
}
