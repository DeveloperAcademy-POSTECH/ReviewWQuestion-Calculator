//
//  firstRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI


struct firstRow: View {
    
    @Binding var result: Int
    
    @EnvironmentObject var calculateData: calculateData
    @EnvironmentObject var operationData: operationData
    
    var body: some View {
        HStack(spacing:14) {
            Button(action: {
                calculateData.result = 0
                calculateData.calculSequence = []
                calculateData.resultSequence = []
            }) {
                Text("AC")
                    .font(.system(size: 35))
                    .frame(width:85, height: 85)
                    .foregroundColor(.black)
                    .background(Color.lightGray)
                    .clipShape(Circle())
            }
            Button(action: {
                
            }) {
                Text("+/-")
                    .font(.system(size: 35))
                    .frame(width:85, height: 85)
                    .foregroundColor(.black)
                    .background(Color.lightGray)
                    .clipShape(Circle())
            }
            Button(action: {
                
            }) {
                Text("%")
                    .font(.system(size: 35))
                    .frame(width:85, height: 85)
                    .foregroundColor(.black)
                    .background(Color.lightGray)
                    .clipShape(Circle())
            }
            Button(action: {
                // 색상변화
                operationData.operationReset()
                operationData.operationIsActive[0].toggle()
            
                // 계산로직
                calculateData.resultSequence.append(calculateData.result)
                let lastIndex = calculateData.resultSequence.count
                
                if calculateData.calculSequence.isEmpty || calculateData.calculSequence.last == "=" {
                    calculateData.calculSequence.append("÷")
                } else {
                    
                    calculateData.result = calculateData.calculate(calculateData.resultSequence[lastIndex-2], calculateData.resultSequence[lastIndex-1], calculateData.calculSequence.last ?? "")
                    calculateData.calculSequence.append("÷")
                    calculateData.resultSequence = [calculateData.result]

                }
                
                calculateData.iscalculated = true
                
            }) {
                Text("÷")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(operationData.operationIsActive[0] ? Color.customOrange : .white)
                    .background(operationData.operationIsActive[0] ? .white : Color.customOrange)
                    .clipShape(Circle())
            }
            
        }
    }
}

struct firstRow_Previews: PreviewProvider {
    static var previews: some View {
        firstRow(result: .constant(0))
    }
}
