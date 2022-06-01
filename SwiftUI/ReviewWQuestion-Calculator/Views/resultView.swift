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
                .lineLimit(1)
                .foregroundColor(.white)
                .font(.system(size: 80))
                .padding([.horizontal])
        }
    }
    
    func resultCondition() -> String {
        // 어디서 잘라야 하지(?)
        // 숫자 더해줄 때는 0.0이 아니라 0에서 시작해야함.
        // 숫자 키패드 누를 때는 무조건
        var resultString: String = "\(calculateData.result)"
        var totalResult: String = ""
        
        if calculateData.result == 3.141592 {
            totalResult = "오류"
        } else {
            if calculateData.result == Float(Int(calculateData.result)) {
                if let index = resultString.firstIndex(of: ".") {
                    totalResult = String(resultString[..<index])
                }
                
                //            print(round(calculateData.result))
                //            return floor(calculateData.result)
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
