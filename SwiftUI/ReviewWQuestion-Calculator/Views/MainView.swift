//
//  MainView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct MainView: View {
    @State var number: Double = 100000000/7
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .trailing) {
                Spacer(minLength: g.size.height * 0.28)
                OutputView(number: $number)
                InputView(number: $number)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().background(.black)
    }
}
