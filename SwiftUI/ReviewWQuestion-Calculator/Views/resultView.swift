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
            Text(resultCondition())
//                .lineLimit(1)
                .foregroundColor(.white)
                .font(.system(size: 60))
                .padding([.horizontal])
        }
    }
    
    func resultCondition() -> String {

        var resultString: String = "\(calculateData.result)"
        var totalResult: String = ""
        
        if calculateData.result == 3.1415926535 {
            totalResult = "오류"
        } else {
            if calculateData.result == Float(Int(calculateData.result)) {
                if let index = resultString.firstIndex(of: ".") {
                    totalResult = String(resultString[..<index])
                }
                
            } else {
                totalResult = String(calculateData.result)
            }
        }
        
        return totalResult
    }
}

//struct resultView_Previews: PreviewProvider {
//    static var previews: some View {
//        resultView()
//    }
//}
