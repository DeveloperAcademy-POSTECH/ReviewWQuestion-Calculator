//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("result")
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.3, alignment: .bottomTrailing)
            ForEach(0..<5) { i in
                HStack(spacing: 10) {
                    CircleButton(color: Color.orange, text: "1")
                    CircleButton(color: Color.green, text: "1")
                    CircleButton(color: Color.blue, text: "1")
                    CircleButton(color: Color.pink, text: "1")
                } // HStack
            } // ForEach
        } // VStack
    } // body
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
