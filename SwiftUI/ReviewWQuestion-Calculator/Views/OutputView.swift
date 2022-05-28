//
//  OutputView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct OutputView: View {
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Text("123,456,789")
            .font(.system(size:width * 0.15))
            .multilineTextAlignment(.trailing)
            .lineLimit(1)
            .foregroundColor(.white)
            .padding(.all)
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView().background(.black)
    }
}
