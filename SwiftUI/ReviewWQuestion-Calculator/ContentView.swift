//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    private let keypads: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ForEach(keypads, id: \.self) { keypads in
                    HStack(spacing: 0) {
                        ForEach(keypads, id: \.self) { keypad in
                            Button(action: {
                                
                            }, label: {
                                switch keypad {
                                case "0":
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(Color("DarkGray"))
                                            .frame(width: 174,height: 80)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .padding(.leading, 32)
                                    }
                                case "AC", "+/-", "%":
                                    ZStack {
                                        Circle()
                                            .fill(.gray)
                                            .frame(width: 80, height: 80)
                                        Text(keypad)
                                            .foregroundColor(.black)
                                            .font(.title)
                                    }
                                case "÷", "×", "−", "+", "=":
                                    ZStack(alignment: .top) {
                                        Circle()
                                            .fill(.orange)
                                            .frame(width: 80, height: 80)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.system(size: 42))
                                            .frame(height:75)
                                    }
                                default:
                                    ZStack {
                                        Circle()
                                            .fill(Color("DarkGray"))
                                            .frame(width: 80, height: 80)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                    }
                                }
                            })
                            .padding(7)
                        }
                    }
                }
            }
            .padding(.horizontal, 17)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
