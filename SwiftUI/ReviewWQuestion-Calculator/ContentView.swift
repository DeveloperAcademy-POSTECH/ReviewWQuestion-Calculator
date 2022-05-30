//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CalculatorViewModel()
    
    var body: some View {
        VStack{
            VStack {
                Spacer()
                NumberTextView(vm: vm)
                CalculatorButtonView(vm: vm)
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
