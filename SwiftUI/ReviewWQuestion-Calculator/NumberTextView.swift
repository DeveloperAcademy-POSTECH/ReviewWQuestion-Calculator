//
//  NumberTextView.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/28.
//

import SwiftUI

struct NumberTextView: View {
    
    var fontSize: CGFloat = 100
    @State private var text = "0"
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        Text(text)
            .font(.system(size: fontSize))
            .frame(width: size.width - 40, height: size.height / 8, alignment: .trailing)
            
    }
}

struct NumberTextView_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextView()
    }
}
