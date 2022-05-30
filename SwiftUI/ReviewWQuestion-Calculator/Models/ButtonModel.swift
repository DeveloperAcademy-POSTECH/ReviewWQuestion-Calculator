//
//  ButtonModel.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/05/30.
//

import Foundation
import SwiftUI

struct ButtonModel:Identifiable{
    var id = UUID().uuidString
    let name:String
    let function:String // function, operator, number
    let color:Color // 버튼의 색상
    
    init(name:String, function:String, color:Color){
        self.name = name
        self.function = function
        self.color = color
    }
}
