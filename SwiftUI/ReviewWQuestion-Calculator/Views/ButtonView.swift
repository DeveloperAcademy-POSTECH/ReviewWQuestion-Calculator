//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct ButtonView: View {
    @Binding var number: Double
    var color: Color
    var text: String
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                Button(action: {
                    if let num = Int(text) {
                        if num <= 11 {
                            number = number * 10 + Double(num)
                        }
                    }
                    else if text == "C" {
                        number = 0
                    }
                }) {
                    Circle()
                        .foregroundColor(color)
                }
                Text(text)
                    .font(.system(size: g.size.width < g.size.height ? g.size.width * 0.6 : g.size.height * 0.6))
                    .foregroundColor(color != Color.funcButton ? .white : .black)
            }
//            .padding(g.size.width < g.size.height ? g.size.width * 0.01 : g.size.height * 0.01)
        }
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(color: Color.operatorButton, text: "1")
//
//    }
//}
