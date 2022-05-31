//
//  resultView.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct resultView: View {
    
    @Binding var result: Int
    @EnvironmentObject var calculateData: calculateData
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(calculateData.result)")
                .lineLimit(1)
                .foregroundColor(.white)
                .font(.system(size: 80))
                .padding([.horizontal])
        }
    }
    
    func resultCondition() {
        
    }
}

//struct resultView_Previews: PreviewProvider {
//    static var previews: some View {
//        resultView()
//    }
//}
