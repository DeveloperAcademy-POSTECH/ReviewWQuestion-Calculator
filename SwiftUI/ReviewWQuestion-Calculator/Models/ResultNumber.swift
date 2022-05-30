//
//  ResultNumber.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/05/31.
//

import Foundation

class ResultNumber:ObservableObject{
    @Published var resultNumber:Int
    
    init(){
        self.resultNumber = 0
    }
    
    func checkDisplayResultNumber(buttonModel:ButtonModel){
        if buttonModel.name == "AC"{
            self.resultNumber = 0
            return
        }else if buttonModel.function == "function"{
            return
        }else if buttonModel.function == "number"{
            if self.resultNumber/100000000 >= 1{
                return
            }
            inputNumberCheck(buttonModel:buttonModel)
        }
    }
    
    func inputNumberCheck(buttonModel:ButtonModel){
        if self.resultNumber == 0{
            self.resultNumber = Int(buttonModel.name)!
        }else{
            self.resultNumber = self.resultNumber*10 + Int(buttonModel.name)!
        }
    }
    
}
