//
//  resultView.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct resultView: View {
    @Binding var result: Int
    var body: some View {
        HStack {
            Spacer()
            Text("\(result)")
                .foregroundColor(.white)
                .font(.system(size: 80))
                .padding([.horizontal])
        }
    }
}

//struct resultView_Previews: PreviewProvider {
//    static var previews: some View {
//        resultView()
//    }
//}
