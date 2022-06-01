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
            left? += num
        }
        else {
            left = num
        }
    }
    
    func append_right(_ num: String) {
        if right != nil {
            right? += num
        }
        else {
            right = num
        }
    }
    
    func update_left(_ _oper: String) {
        doOperate(_oper)
    }
    
    func clear() {
        if output != nil {
            output = nil
        }
        else if right != nil {
            right = nil
        }
        else {
            left = nil
        }
    }
    
    func allclear() {
        left = nil
        oper = nil
        right = nil
        output = nil
        store = nil
    }
    
    func doOperate(_ _oper: String) {
        switch _oper {
        case "+":
            left = String(Double(left!)! + Double(right!)!)
        case "÷":
            left = String(Double(left!)! / Double(right!)!)
        case "×":
            left = String(Double(left!)! * Double(right!)!)
        case "−":
            left = String(Double(left!)! - Double(right!)!)
        case "=":
            doOperate(oper!)
        default:
            ()
        }
        right = nil
        
    }
    
    func calculate() {
        
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
