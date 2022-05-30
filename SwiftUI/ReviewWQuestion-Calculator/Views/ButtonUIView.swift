//
//  ButtonUIView.swift
//  ReviewWQuestion-Calculator
//
//  Created by 박성수 on 2022/05/30.
//

import SwiftUI
var buttonWidth:CGFloat = 85
var buttonHeight:CGFloat = 85

struct ButtonUIView: View {
    var buttonModel:ButtonModel
    
    var body: some View {
        ZStack {
            Button(action: {
                
            }, label: {
                Circle().foregroundColor(buttonModel.color)
            })
            .frame(width:buttonWidth, height: buttonHeight)
            Text(buttonModel.name)
                .foregroundColor(buttonModel.function == "function" ? .black : .white)
                .font(.system(size: 40))
        }
    }
}

struct ButtonUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonUIView(buttonModel: ButtonModel(name: "AC", function: "function", color: Color(.lightGray)))
            ButtonUIView(buttonModel: ButtonModel(name: "+", function: "operator", color: Color(.systemOrange)))
        }
        .previewLayout(.sizeThatFits)
    }
}
