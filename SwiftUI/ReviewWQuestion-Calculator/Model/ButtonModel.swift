//
//  ButtonModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/30.
//

import Foundation
import SwiftUI

struct CalcButton: Identifiable {
    var stack = Stack<String>()
    let id: UUID
    var text: String
    var backgroundColor: Color
    var textColor: Color
    
    init(id: UUID = UUID(), text: String, backgroundColor: Color, textColor: Color){
        self.id = id
        self.text = text
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

extension CalcButton {
    public struct Stack<T> {
        private var elements = [T]()
        
        public mutating func pop() -> T? {
            return self.elements.popLast()
        }
        
        public mutating func push(_ element: T) {
            self.elements.append(element)
        }
        
        public func top() -> T? {
            return self.elements.last
        }
        
        public func isEmpty() -> Bool {
            return self.elements.isEmpty
        }
        
        public var size: Int {
            return self.elements.count
        }
    }
}

extension CalcButton {
    static let calcButtonData: [CalcButton] =
    [
        CalcButton(text: "AC", backgroundColor: Color.buttonGray, textColor: Color.textBlack),
        CalcButton(text: "+/-", backgroundColor: Color.buttonGray, textColor: Color.textBlack),
        CalcButton(text: "%", backgroundColor: Color.buttonGray, textColor: Color.textBlack),
        CalcButton(text: "÷", backgroundColor: Color.buttonOrange, textColor: Color.textWhite),
        
        CalcButton(text: "7", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "8", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "9", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "×", backgroundColor: Color.buttonOrange, textColor: Color.textWhite),
        
        CalcButton(text: "4", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "5", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "6", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "−", backgroundColor: Color.buttonOrange, textColor: Color.textWhite),
        
        CalcButton(text: "1", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "2", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "3", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "+", backgroundColor: Color.buttonOrange, textColor: Color.textWhite),
        
        CalcButton(text: "0", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "0", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: ".", backgroundColor: Color.buttonDarkGray, textColor: Color.textWhite),
        CalcButton(text: "=", backgroundColor: Color.buttonOrange, textColor: Color.textWhite)
    ]
}



extension CalcButton {
    mutating func clear(){
        while !stack.isEmpty() {
            stack.pop()
        }
    }
    
    mutating func equal(){
        
    }
    
    mutating func divide(){
        stack.push("÷")
    }
    
    mutating func time(){
        stack.push("×")
    }
    
    mutating func plus(){
        stack.push("÷")
    }
    
    mutating func minus(){
        stack.push("−")
    }
    
    mutating func zero(){
        stack.push("0")
    }

    mutating func one(){
        stack.push("1")
    }
    
    mutating func two(){
        stack.push("2")
    }
    
    mutating func three(){
        stack.push("3")
    }
    
    mutating func four(){
        stack.push("4")
    }
    
    mutating func five(){
        stack.push("5")
    }
    
    mutating func six(){
        stack.push("6")
    }
    
    mutating func seven(){
        stack.push("7")
    }
    
    mutating func eight(){
        stack.push("8")
    }
    
    mutating func nine(){
        stack.push("9")
    }
}
