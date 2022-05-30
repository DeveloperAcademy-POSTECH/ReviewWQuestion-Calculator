//
//  OutputView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct OutputView: View {
    @Binding var number: Double
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Text(number != Double(Int(number)) ? "\(number)" : "\(Int(number))")
            .font(.system(size:width * 0.15))
            .multilineTextAlignment(.trailing)
            .lineLimit(1)
            .foregroundColor(.white)
            .padding(.all)
    }
}

//struct OutputView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutputView().background(.black)
//    }
//}
