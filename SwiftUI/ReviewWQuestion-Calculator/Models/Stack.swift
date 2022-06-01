//
//  Stack.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/06/01.
//

import Foundation

struct Stack{
    var calculateStack:[String] = []
    
    mutating func initializeStack(){
        self.calculateStack.removeAll()
    }
    
    mutating func push(element:String){
        self.calculateStack.append(element)
    }
    
    mutating func pop() -> String{
        return self.calculateStack.removeLast()
        // 값에서 바로 숫자 추가해서 진행하는 과정 안댐
    }
}
