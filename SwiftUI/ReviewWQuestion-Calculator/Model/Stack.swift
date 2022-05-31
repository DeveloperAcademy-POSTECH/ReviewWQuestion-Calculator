//
//  Stack.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/31.
//

import Foundation

public struct Stack<String> {
    public var elements = [String]()
    
    public mutating func pop() -> String? {
        return self.elements.popLast()
    }
    
    public mutating func push(_ element: String) {
        self.elements.append(element)
    }
    
    public func top() -> String? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var size: Int {
        return self.elements.count
    }
    
    mutating func clear(){
        while !self.isEmpty() {
            self.pop()
        }
    }
    
    mutating func equal(){
        
    }
    
    mutating func divide(){
        self.push("÷" as! String)
    }
    
    mutating func time(){
        self.push("×" as! String)
    }
    
    mutating func plus(){
        self.push("÷" as! String)
    }
    
    mutating func minus(){
        self.push("−" as! String)
    }
    
    mutating func zero(){
        self.push("0" as! String)
    }

    mutating func one(){
        self.push("1" as! String)
    }
    
    mutating func two(){
        self.push("2" as! String)
    }
    
    mutating func three(){
        self.push("3" as! String)
    }
    
    mutating func four(){
        self.push("4" as! String)
    }
    
    mutating func five(){
        self.push("5" as! String)
    }
    
    mutating func six(){
        self.push("6" as! String)
    }
    
    mutating func seven(){
        self.push("7" as! String)
    }
    
    mutating func eight(){
        self.push("8" as! String)
    }
    
    mutating func nine(){
        self.push("9" as! String)
    }
    
    mutating func choiceOperator(value: Swift.String){
        switch value {
        case "AC":
            clear()
        case "+/-":
            print("+/-")
        case "%":
            print("%")
        case "÷":
            divide()
        case "7":
            seven()
        case "8":
            eight()
        case "9":
            nine()
        case "×":
            time()
        case "4":
            four()
        case "5":
            five()
        case "6":
            six()
        case "−":
            minus()
        case "1":
            one()
        case "2":
            two()
        case "3":
            three()
        case "+":
            plus()
        case "0":
            zero()
        case ".":
            print(".")
        case "=":
            equal()
        default:
            print("default")
        }
    }
}
