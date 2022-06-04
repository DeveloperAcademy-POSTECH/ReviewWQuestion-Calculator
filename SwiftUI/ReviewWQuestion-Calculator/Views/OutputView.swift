//
//  OutputView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct OutputView: View {
    @EnvironmentObject var expression: Expression
    let width = UIScreen.main.bounds.width

    var body: some View {
        Text(expression.display())
            .font(.system(size: width * 0.15))
            .multilineTextAlignment(.trailing)
            .lineLimit(1)
            .foregroundColor(.white)
            .padding(.all)
    }
}
