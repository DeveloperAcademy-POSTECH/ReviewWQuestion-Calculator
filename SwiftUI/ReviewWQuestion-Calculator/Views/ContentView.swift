//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    @State private var result: Int = 0
    
    @StateObject var calculateData: calculateData
    @StateObject var operationData: operationData
    
    
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
            .environmentObject(calculateData)
            .environmentObject(operationData)
        }
        .onAppear(perform: {
            var test: String = String(calculateData.result)
            // 0.0 어디서 잘라야 할까
            if calculateData.result == Float(Int(calculateData.result)) {
                print("same")
                // float이 정수일 때에는 밑을 잘라버림
            }
            print(test.count)
            if test.contains(".") {
                print("true")
            }
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calculateData: calculateData(), operationData: operationData())
    }
}
