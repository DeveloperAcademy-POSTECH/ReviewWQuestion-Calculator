//
//  MainView.swift
//  ReviewWQuestion-Calculator
//
//  Created by taekkim on 2022/05/28.
//

import SwiftUI

struct MainView: View {
    @StateObject var expression = ExpressionModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                Spacer(minLength: geometry.size.height * 0.2)
                OutputView()
                InputView()
            }.environmentObject(expression)
        }.onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }.onDisappear {
            AppDelegate.orientationLock = .portrait
            AppDelegate.orientationLock = .all
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().background(.black).previewInterfaceOrientation(.portrait)
    }
}
