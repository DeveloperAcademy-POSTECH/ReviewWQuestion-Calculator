//
//  CustomButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CustomButton: View {
    let buttonInfo: CalculatorButtonManager
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        //GeometryReader { proxy in
            Button(action: {
            } , label: {
                Circle()
                    .foregroundColor(Color(buttonInfo.background))
                    .frame(width: size.width / 5, height: size.width / 5, alignment: .center)
                    .overlay(content: {
                        Text(buttonInfo.label)
                            .bold()
                            .font(.system(size: size.width / 10))
                            .accentColor(.black)
                    })
                
            })
        //}
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonInfo: CalculatorButtonManager.allClear)
            .previewInterfaceOrientation(.portrait)
    }
}
