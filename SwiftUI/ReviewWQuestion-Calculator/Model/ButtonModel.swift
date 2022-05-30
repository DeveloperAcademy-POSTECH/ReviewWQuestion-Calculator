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

