//
//  thirdRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct thirdRow: View {
    
    @Binding var result: Int
    @EnvironmentObject var calculateData: calculateData
    @EnvironmentObject var operationData: operationData
    
    
    var body: some View {
        HStack(spacing:14) {
            ForEach(4..<7){ i in
                Button(action: {
                    // 색상변화
                    operationData.operationReset()
                    
                    var resultString: String = calculateData.isProcessed()
                    
                    if calculateData.iscalculated {
                        resultString = "\(i)"
                        calculateData.iscalculated = false
                    } else {
                        resultString += "\(i)"
                    }
                    
                    calculateData.result = Float(resultString) ?? 0
                    
                }) {
                    Text("\(i)")
                        .font(.system(size: 40))
                        .frame(width:85, height: 85)
                        .foregroundColor(.white)
                        .background(Color.darkGray)
                        .clipShape(Circle())
                }
            }
            Button(action: {
                // 색상변화
                operationData.operationReset()
                operationData.operationIsActive[2].toggle()
                // 계산로직
                calculateData.resultSequence.append(calculateData.result)
                let lastIndex = calculateData.resultSequence.count
                
                if calculateData.calculSequence.isEmpty || calculateData.calculSequence.last == "=" {
                    calculateData.calculSequence.append("−")
                } else {
                    
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[lastIndex-2], calculateData.resultSequence[lastIndex-1], calculateData.calculSequence.last ?? "")
                    calculateData.calculSequence.append("−")
                    calculateData.resultSequence = [calculateData.result]

                }
                
                calculateData.iscalculated = true
            }) {
                Text("−")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(operationData.operationIsActive[2] ? Color.customOrange : .white)
                    .background(operationData.operationIsActive[2] ? .white : Color.customOrange)
                    .clipShape(Circle())
            }
        }
    }
}

struct thirdRow_Previews: PreviewProvider {
    static var previews: some View {
        thirdRow(result: .constant(0))
    }
}
