//
//  CustomButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by KiWoong Hong on 2022/05/29.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        //GeometryReader { proxy in
            Button(action: {
            } , label: {
                Circle()
                    .frame(width: size.width / 5, height: size.width / 5, alignment: .center)
                    .overlay(content: {
                        Text("1")
                            .bold()
                            .font(.system(size: size.width / 10))
                            .accentColor(.primary)
                    })
                
            })
        //}
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
            .previewInterfaceOrientation(.portrait)
    }
}
