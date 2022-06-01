//
//  fourthRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct fourthRow: View {
    
    @Binding var result: Int
    @EnvironmentObject var calculateData: calculateData
    @EnvironmentObject var operationData: operationData
    
    
    var body: some View {
        HStack(spacing:14){
            ForEach(1..<4){ i in
                Button(action: {
                    var resultString: String = calculateData.isProcessed()
                    operationData.operationReset()
                    
                    //
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
                // 3 + 3 + 3
                // 색상변화
                operationData.operationReset()
                operationData.operationIsActive[3].toggle()
                //
                calculateData.resultSequence.append(calculateData.result)
                
                if calculateData.calculSequence.isEmpty {
                    calculateData.calculSequence.append("+")
                } else {
                    
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[0], calculateData.resultSequence[1])
                    calculateData.resultSequence = [calculateData.result]
                    calculateData.calculSequence = ["+"]
                }
                
                calculateData.iscalculated = true
                
            }) {
                Text("+")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(operationData.operationIsActive[3] ? Color.customOrange : .white)
                    .background(operationData.operationIsActive[3] ? .white : Color.customOrange)
                    .clipShape(Circle())
            }
        }
    }
}

struct fourthRow_Previews: PreviewProvider {
    static var previews: some View {
        fourthRow(result: .constant(0))
    }
}
