//
//  firstRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI


struct firstRow: View {
    
    @Binding var result: Int
    
    var body: some View {
        HStack(spacing:14) {
            Button(action: {
                result = 0
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
                
            }) {
                Text("÷")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(.white)
                    .background(Color.customOrange)
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
