//
//  CalculatorButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CalculatorButtonView: View {
   
    var columns: [GridItem] = .init(repeating: GridItem(.flexible()), count: 4)
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(CalculatorButtonType.allCases, id: \.self) { buttonType in
                CalculatorCustomButton(calculatorButtonType: buttonType, calculatorViewModel: calculatorViewModel)
            }
        }
        .padding()
        .padding(.bottom, 30)
        .frame(width: UIScreen.main.bounds.width)
    }
}
