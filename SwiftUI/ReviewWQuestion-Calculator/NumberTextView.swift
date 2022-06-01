//
//  NumberTextView.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/28.
//

import SwiftUI

struct NumberTextView: View {
    
    var fontSize: CGFloat = 100
    @ObservedObject var vm: CalculatorViewModel
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        Text(vm.text)
            .frame(width: size.width - 40, height: size.height / 8, alignment: .trailing)
            .font(.system(size: fontSize))
            .minimumScaleFactor(0.5)
            
    }
}

