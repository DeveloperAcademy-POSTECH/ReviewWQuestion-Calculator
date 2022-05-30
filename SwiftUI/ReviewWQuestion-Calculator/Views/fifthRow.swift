//
//  fifthRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct fifthRow: View {
    
    @Binding var result: Int
    
    var body: some View {
        HStack(spacing:14) {
            Button(action: {
                
                var resultString: String = "\(result)"
                if resultString == "0" {
                    
                } else {
                    resultString += "0"
                }
                result = Int(resultString) ?? 0
                
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
