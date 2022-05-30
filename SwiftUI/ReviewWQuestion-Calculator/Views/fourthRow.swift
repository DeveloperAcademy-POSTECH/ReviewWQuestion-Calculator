//
//  fourthRow.swift
//  ReviewWQuestion-Calculator
//
//  Created by 최동권 on 2022/05/30.
//

import SwiftUI

struct fourthRow: View {
    var body: some View {
        HStack(spacing:14){
            ForEach(1..<4){ i in
                Button(action: {
                    
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
                
            }) {
                Text("+")
                    .font(.system(size: 50))
                    .frame(width:85, height: 85)
                    .foregroundColor(.white)
                    .background(Color.customOrange)
                    .clipShape(Circle())
            }
        }
    }
}

struct fourthRow_Previews: PreviewProvider {
    static var previews: some View {
        fourthRow()
    }
}
