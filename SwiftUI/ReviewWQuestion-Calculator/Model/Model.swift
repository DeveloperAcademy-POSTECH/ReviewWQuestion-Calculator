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
