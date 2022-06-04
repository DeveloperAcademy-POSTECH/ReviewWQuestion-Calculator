//
//  Model.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/30.
//

import SwiftUI

class Expression: ObservableObject {
    @Published var left: String?
    @Published var oper: String?
    @Published var right: String?
    @Published var output: String?

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
        if let output = output {
            return output
        }
        if let right = right {
            return right
        }
        if let left = left {
            return left
        } else {
            return "0"
        }
    }
}
