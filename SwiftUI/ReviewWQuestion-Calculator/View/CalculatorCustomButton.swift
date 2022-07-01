//
//  CustomButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CalculatorCustomButton: View {
    
    let calculatorButtonType: CalculatorButtonType
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        Button(action: {
            calculatorViewModel.input(button: calculatorButtonType)
        }, label: {
            Circle()
                .foregroundColor(Color(calculatorButtonType.background))
                .frame(width: size.width / 5, height: size.width / 5, alignment: .center)
                .overlay(content: {
                    if calculatorButtonType.labelType == "text" {
                        Text(calculatorButtonType.label)
                            .bold()
                            .font(.system(size: size.width / 10))
                            .accentColor(Color(calculatorButtonType.labelColor))
                    } else {
                        Image(systemName: calculatorButtonType.label)
                            .font(.system(size: size.width / 14))
                            .accentColor(Color(calculatorButtonType.labelColor))
                    }
                })
        })
    }
}
