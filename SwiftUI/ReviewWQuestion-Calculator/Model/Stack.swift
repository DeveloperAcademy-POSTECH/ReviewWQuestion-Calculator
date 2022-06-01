//
//  Stack.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/31.
//

import Foundation

// 더이상 스택이 아니게 되어버린것..
// Cannot convert value of type 'Swift.String' to specified type 'String'
// public struct Stack<String> { 으로 만드니깐 다음과 같은 에러가 발생함
public struct Stack{
    public var elements = [String]()
    public var temp: String = "0"
    
    
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
    
    public mutating func popFirst() -> String {
        return self.elements.removeFirst()
    }
    
    mutating func clear(){
        while !self.isEmpty() {
            self.pop()
        }
    }
    
    mutating func equal(){
        
    }
    
    mutating func divide(){
        self.push("÷")
    }
    
    mutating func time(){
        self.push("×")
    }
    
    mutating func plus(){
        self.push("+")
    }
    
    mutating func minus(){
        self.push("−")
    }
    
    mutating func zero(){
        self.push("0")
    }

    mutating func one(){
        self.push("1")
        self.temp
    }
    
    mutating func two(){
        self.push("2")
    }
    
    mutating func three(){
        self.push("3")
    }
    
    mutating func four(){
        self.push("4")
    }
    
    mutating func five(){
        self.push("5")
    }
    
    mutating func six(){
        self.push("6")
    }
    
    mutating func seven(){
        self.push("7")
    }
    
    mutating func eight(){
        self.push("8")
    }
    
    mutating func nine(){
        self.push("9")
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
