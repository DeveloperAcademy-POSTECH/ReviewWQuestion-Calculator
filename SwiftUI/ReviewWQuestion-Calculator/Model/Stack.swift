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
    public var temp: String = ""
    
    
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
        if !temp.isEmpty {
            self.push(temp)
            self.temp = ""
        }
        self.push("÷")
    }
    
    mutating func time(){
        if !temp.isEmpty {
            self.push(temp)
            self.temp = ""
        }
        self.push("×")
    }
    
    mutating func plus(){
        if !temp.isEmpty {
            self.push(temp)
            self.temp = ""
        }
        self.push("+")
    }
    
    mutating func minus(){
        if !temp.isEmpty {
            self.push(temp)
            self.temp = ""
        }
        self.push("−")
    }
    
    mutating func zero(){
//        self.push("0")
        if temp == "0" {
            
        } else {
            if temp.count < 9 {
                self.temp += "0"
            }
        }
    }

    mutating func one(){
//        self.p ush("1")
        if temp.count < 9 {
            self.temp += "1"
        }
    }
    
    mutating func two(){
//        self.push("2")
        if temp.count < 9 {
            self.temp += "2"
        }
    }
    
    mutating func three(){
//        self.push("3")
        if temp.count < 9 {
            self.temp += "3"
        }
    }
    
    mutating func four(){
//        self.push("4")
        if temp.count < 9 {
            self.temp += "4"
        }
    }
    
    mutating func five(){
//        self.push("5")
        if temp.count < 9 {
            self.temp += "5"
        }
    }
    
    mutating func six(){
//        self.push("6")
        if temp.count < 9 {
            self.temp += "6"
        }
    }
    
    mutating func seven(){
//        self.push("7")
        if temp.count < 9 {
            self.temp += "7"
        }
    }
    
    mutating func eight(){
//        self.push("8")
        if temp.count < 9 {
            self.temp += "8"
        }
    }
    
    mutating func nine(){
//        self.push("9")
        if temp.count < 9 {
            self.temp += "9"
        }
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
