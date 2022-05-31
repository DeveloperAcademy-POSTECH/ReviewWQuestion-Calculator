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
                    operationData.operationReset()
                    var resultString: String = "\(calculateData.result)"
                    //
                    if calculateData.iscalculated {
                        resultString = "\(i)"
                        calculateData.iscalculated = false
                    } else {
                        resultString += "\(i)"
                    }
                    
                    calculateData.result = Double(resultString) ?? 0
                    
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
                operationData.operationReset()
                operationData.operationIsActive[2].toggle()
                
                calculateData.resultSequence.append(calculateData.result)
                
                if calculateData.calculSequence.isEmpty {
                    calculateData.calculSequence.append("-")
                } else {
                    
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[0], calculateData.resultSequence[1])
                    calculateData.resultSequence = [calculateData.result]
                    calculateData.calculSequence = ["-"]
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
