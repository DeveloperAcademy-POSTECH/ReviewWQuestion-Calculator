//
//  ResultNumber.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/05/31.
//

import Foundation

class ResultNumber:ObservableObject{
    @Published var calculatedNumber:String = "0"// 화면상에 표시되는 숫자
    var currentOperator:String? = nil
    var isStart:Bool = true
    var operatorTemp:String? = nil
    var numberTemp:String? = nil
    var numberStack:Stack = Stack()
    var operatorStack:Stack = Stack()
    
    func checkDisplayResultNumber(buttonModel:ButtonModel){
        switch buttonModel.function{
            
        case "function":
            if buttonModel.name == "AC"{
                self.calculatedNumber = "0"
                self.isStart = true
                self.currentOperator = nil
                self.numberTemp = nil
                self.operatorTemp = nil
                self.numberStack.initializeStack()
                self.operatorStack.initializeStack()
                return
            }
        case "operator":
            if calculatedNumber == "오류"{
                return
            }
            if buttonModel.name == "="{
                if numberTemp != nil{
                    numberStack.push(element: numberTemp!)
                }
                
                if numberStack.calculateStack.last == "0" && operatorStack.calculateStack.last == "÷"{
                    calculatedNumber = "오류"
                    return
                }
                
                numberTemp = nil
                print(numberStack)
                print(operatorStack)
                
                while numberStack.calculateStack.count != 1{
                    operate()
                }
            }
            else{
                self.operatorTemp = buttonModel.name
                self.currentOperator = operatorTemp

                if numberTemp != nil{
                    numberStack.push(element: numberTemp!)
                }
                numberTemp = nil
                return
            }
            
        case "number":
            if calculatedNumber == "오류"{
                return
            }
            if self.operatorTemp != nil{
                isStart.toggle()
                
                operatorStack.push(element: operatorTemp!)
                print(operatorStack)
            }
            if isStart{
                if self.calculatedNumber.count >= 9 {
                    return
                }
                if self.calculatedNumber == "0" || self.calculatedNumber == "오류"{
                    self.calculatedNumber = buttonModel.name
                }
                else{
                    self.calculatedNumber += buttonModel.name
                }
                self.numberTemp = self.calculatedNumber
            }else{
                self.calculatedNumber = buttonModel.name
                numberTemp = self.calculatedNumber
                isStart.toggle()
                operatorTemp = nil
            }
        default:
            return
        }
    }
    
    func operate(){
        let temp1 = Int(numberStack.pop())!
        let temp2 = Int(numberStack.pop())!
        _ = operatorStack.pop()
        switch self.currentOperator{
        case "+":
            numberStack.push(element: String(temp1 + temp2))
            self.calculatedNumber = numberStack.calculateStack.last!
        case "-":
            numberStack.push(element: String(temp2 - temp1))
            self.calculatedNumber = numberStack.calculateStack.last!
        case "×":
            numberStack.push(element: String(temp1 * temp2))
            self.calculatedNumber = numberStack.calculateStack.last!
        case "÷":
            numberStack.push(element: String(temp2 / temp1))
            self.calculatedNumber = numberStack.calculateStack.last!
        default:
            return
        }
    }
        
}
