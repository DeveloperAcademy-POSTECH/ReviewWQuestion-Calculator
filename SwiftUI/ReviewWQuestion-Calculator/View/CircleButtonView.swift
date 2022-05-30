//
//  CircleButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/29.
//

import SwiftUI

struct CircleButtonView: View {
    @State var backgroundColor: Color
    @State var text: String
    @State var textColor: Color
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: UIScreen.main.bounds.width*0.22, height: UIScreen.main.bounds.width*0.22)
            .overlay{
                Text(text)
                    .font(.system(size: 40))
                    .foregroundColor(textColor)
            }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(backgroundColor: Color.red, text: "1", textColor: Color.textWhite)
    }
}
