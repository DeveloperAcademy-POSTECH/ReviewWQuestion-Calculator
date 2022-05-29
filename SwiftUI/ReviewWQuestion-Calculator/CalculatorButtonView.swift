//
//  CalculatorButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CalculatorButtonView: View {
   
    var columns: [GridItem] = .init(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(CalculatorButtonManager.allCases, id: \.self) { item in
                CustomButton(buttonInfo: item)
            }
        }
        .padding()
        .padding(.bottom, 30)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView()
    }
}
