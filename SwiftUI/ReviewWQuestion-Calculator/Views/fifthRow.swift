//
//  fifthRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct fifthRow: View {
    
    @Binding var result: Int
    @EnvironmentObject var calculateData: calculateData
    @EnvironmentObject var operationData: operationData
    
    var body: some View {
        HStack(spacing:14) {
            Button(action: {
                // 색상변화
                operationData.operationReset()
                
                var resultString: String = calculateData.isProcessed()
                
                if calculateData.iscalculated {
                    resultString = "0"
                    calculateData.iscalculated = false
                } else {
                    resultString += "0"
                }
                
                calculateData.result = Float(resultString) ?? 0
                
            }) {
                Text("0")
                    .font(.system(size: 40))
                    .frame(width:184, height: 85)
                    .foregroundColor(.white)
                    .background(Color.darkGray)
                    .clipShape(Capsule())
            }
            Button(action: {
                
            }) {
                Text(".")
                    .font(.system(size: 40))
                    .frame(width:85, height: 85)
                    .foregroundColor(.white)
                    .background(Color.darkGray)
                    .clipShape(Circle())
            }
            Button(action: {
                
                operationData.operationReset()
                calculateData.resultSequence.append(calculateData.result)
                var lastIndex = calculateData.resultSequence.count
                
                // = 기본 연산 & = 연속 연산
                if calculateData.calculSequence.last == "=" {
                    calculateData.calculSequence.append("=")
                    let seqCopy = calculateData.calculSequence.filter { cal in
                        return cal != "="
                    }
//                    print(seqCopy)
                    calculateData.resultSequence.swapAt(lastIndex-2, lastIndex-1)
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[lastIndex-2], calculateData.resultSequence[lastIndex-1], seqCopy.last ?? "")
                    calculateData.iscalculated = true
                } else {
                    // calculSequence.last가 -일 때에만 ""로 처리되어 switch문의 default로 연산이 진행되는 중
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[lastIndex-2], calculateData.resultSequence[lastIndex-1], calculateData.calculSequence.last ?? "")
                    
                    print(calculateData.result)
                    calculateData.calculSequence.append("=")
                    calculateData.iscalculated = true
                }
                
            }) {
                Text("=")
                    .font(.system(size: 40))
                    .frame(width:85, height: 85)
                    .foregroundColor(.white)
                    .background(Color.customOrange)
                    .clipShape(Circle())
            }
        }
    }
}

struct fifthRow_Previews: PreviewProvider {
    static var previews: some View {
        fifthRow(result: .constant(0))
    }
}
