//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
//    private static let columnCount: Int = 4
//    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: columnCount)
    
    @State private var result: Int = 0
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(spacing:14) {
                Spacer()
                resultView(result: $result)
                firstRow(result: $result)
                secondRow(result: $result)
                thirdRow(result: $result)
                fourthRow(result: $result)
                fifthRow(result: $result)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
