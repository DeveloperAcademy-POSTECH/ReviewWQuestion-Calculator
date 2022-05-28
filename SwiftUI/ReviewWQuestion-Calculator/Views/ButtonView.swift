//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct ButtonView: View {
    var color: Color
    var text: String
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                Button(action: {}) {
                    Circle()
                        .foregroundColor(color)
                }
                Text(text)
                    .font(.system(size: g.size.width < g.size.height ? g.size.width * 0.6 : g.size.height * 0.6))
                    .foregroundColor(color != Color.funcButton ? .white : .black)
            }
//            .padding(g.size.width < g.size.height ? g.size.width * 0.01 : g.size.height * 0.01)
            .onAppear {
                print(g.size)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: Color.operatorButton, text: "1")
            
    }
}
