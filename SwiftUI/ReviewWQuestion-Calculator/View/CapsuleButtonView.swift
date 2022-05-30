//
//  CapsuleButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by Terry Koo on 2022/05/30.
//

import SwiftUI

struct CapsuleButtonView: View {
    var body: some View {
        Capsule()
            .fill(Color.black)
            .frame(width: 200, height: 120)

    }
}

struct CapsuleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButtonView()
    }
}
