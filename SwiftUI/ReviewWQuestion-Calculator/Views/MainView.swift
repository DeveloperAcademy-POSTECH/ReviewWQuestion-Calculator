//
//  MainView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct MainView: View {
    @StateObject var expression = Expression()
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .trailing) {
                Spacer(minLength: g.size.height * 0.28)
                OutputView()
                InputView()
            }.environmentObject(expression)
        }
    }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().background(.black)
    }
}
