//
//  ButtonView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var expression: ExpressionModel
    var color: Color
    var button: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Button { expression.execute(button) } label: {
                    Circle()
                        .foregroundColor(color)
                }
                Text(button)
                    .font(.system(size: geometry.size.width * 0.6))
                    .foregroundColor(color != Color.funcButton ? .white : .black)
            }
        }
    }
}
