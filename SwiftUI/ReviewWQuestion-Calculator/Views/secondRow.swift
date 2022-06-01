//
//  secondRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct secondRow: View {
    
    @Binding var result: Int
    @EnvironmentObject var calculateData: calculateData
    @EnvironmentObject var operationData: operationData
    
    
    var body: some View {
        HStack(spacing:14) {
            ForEach(7..<10){ i in
                Button(action: {
                    var resultString: String = calculateData.isProcessed()
                    operationData.operationReset()
                    
                    if resultString == "0" {
                        resultString = "\(i)"
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
                operationData.operationReset()
                operationData.operationIsActive[1].toggle()
                
                calculateData.resultSequence.append(calculateData.result)
                
                if calculateData.calculSequence.isEmpty {
                    calculateData.calculSequence.append("×")
                } else {
                    
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[0], calculateData.resultSequence[1])
                    calculateData.resultSequence = [calculateData.result]
                    calculateData.calculSequence = ["×"]
                }
                
                calculateData.iscalculated = true
            }) {
                Text("×")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(operationData.operationIsActive[1] ? Color.customOrange : .white)
                    .background(operationData.operationIsActive[1] ? .white : Color.customOrange)
                    .clipShape(Circle())
            }
        }
    }
}

struct secondRow_Previews: PreviewProvider {
    static var previews: some View {
        secondRow(result: .constant(100))
    }
}
