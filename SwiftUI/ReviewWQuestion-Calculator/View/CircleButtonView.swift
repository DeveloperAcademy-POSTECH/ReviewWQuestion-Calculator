//
//  CircleButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/29.
//

import SwiftUI

struct CircleButton: View {
    @State var color: Color
    @State var text: String
    var body: some View {
        Circle()
            .fill(color)
            .overlay{
                Text(text)
                    .font(.system(size: 40))
            }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(color: Color.red, text: "1")
    }
}
