//
//  Model.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/30.
//

import SwiftUI

class Expression : ObservableObject {
    @Published var left: String?
    @Published var oper: String?
    @Published var right: String?
    @Published var output: String?
    @Published var store: Array<(String, String)>?
    
    func append_left(_ num: String) {
        if left != nil {
            if left == "0" {
                left = num
            }
            else {
                left? += num
            }
        }
        else if num == "." {
            left = ".0"
        }
        else {
            left = num
        }
    }
    
    func append_right(_ num: String) {
        if right != nil {
            if right == "0" {
                right = num
            }
            else {
                right? += num
            }
        }
        else if num == "." {
            right = ".0"
        }
        else {
            right = num
        }
    }
    
    func clear() {
        if output != nil {
            output = "0"
        }
        else if right != nil {
            right = "0"
        }
        else {
            left = "0"
        }
    }
    
    func allclear() {
        left = nil
        oper = nil
        right = nil
        output = nil
        store = nil
    }
    
    func doOperate(_ _oper: String) -> String {
        let _str: String
        
        switch _oper {
        case "+":
            _str = String(Double(left!)! + Double(right!)!)
        case "÷":
            _str = String(Double(left!)! / Double(right!)!)
        case "×":
            _str = String(Double(left!)! * Double(right!)!)
        case "−":
            _str = String(Double(left!)! - Double(right!)!)
        default:
            _str = ""
        }
        return _str
    }
    
    func display() -> String {
        if let _output = output {
            return _output
        }
        if let _right = right {
            return _right
        }
        if let _left = left {
            return _left
        }
        else {
            return "0"
        }
    }
}

//class ButtonModel {
//    var str: String
//
//    init(_ str: String) {
//        self.str = str
//    }
//}
//
//class OperatorButton: ButtonModel {
//}
//
//class NumberButton: ButtonModel {
//}
//
//class FuncButton: ButtonModel {
//}
