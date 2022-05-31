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
                operationData.operationReset()
                var resultString: String = "\(calculateData.result)"
                //
                if calculateData.iscalculated {
                    resultString = "0"
                    calculateData.iscalculated = false
                } else {
                    resultString += "0"
                }
                
                calculateData.result = Double(resultString) ?? 0
                
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
                
                calculateData.result = calculateData.calculate(calculateData.resultSequence[0], calculateData.resultSequence[1])
                calculateData.calculSequence = []
                calculateData.resultSequence = []
                calculateData.iscalculated = true
                
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
