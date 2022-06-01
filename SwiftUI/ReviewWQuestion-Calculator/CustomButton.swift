//
//  CustomButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CustomButton: View {
    
    let buttonInfo: CalculatorButtonManager
    @ObservedObject var vm: CalculatorViewModel
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        Button(action: {
            vm.input(button: buttonInfo)
        } , label: {
            Circle()
                .foregroundColor(Color(buttonInfo.background))
                .frame(width: size.width / 5, height: size.width / 5, alignment: .center)
                .overlay(content: {
                    if buttonInfo.labelType == "text" {
                        Text(buttonInfo.label)
                            .bold()
                            .font(.system(size: size.width / 10))
                            .accentColor(Color(buttonInfo.labelColor))
                    } else {
                        Image(systemName: buttonInfo.label)
                            .font(.system(size: size.width / 14))
                            .accentColor(Color(buttonInfo.labelColor))
                    }
                })
        })
    }
}
