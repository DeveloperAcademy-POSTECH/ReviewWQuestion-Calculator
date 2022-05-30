//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State var number: Double = 0
    
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
            
            VStack(alignment: .trailing, spacing: 0) {
                
                Text(String(Int(number)))
                    .foregroundColor(.white)
                    .font(.system(size: 90, weight: .light))
                    .padding(.horizontal, 30)
                    .padding(.bottom, 13)
                
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
                                            .frame(width: (screenWidth / 5) * 2 + 15, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .padding(.leading, screenWidth / 13)
                                    }
                                case "AC", "+/-", "%":
                                    ZStack {
                                        Circle()
                                            .fill(.gray)
                                            .frame(width: screenWidth / 5, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                    }
                                case "÷", "×", "−", "+", "=":
                                    ZStack(alignment: .top) {
                                        Circle()
                                            .fill(.orange)
                                            .frame(width: screenWidth / 5, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.system(size: 46))
                                            .padding(.top, screenWidth / 45)
                                    }
                                default:
                                    ZStack {
                                        Circle()
                                            .fill(Color("DarkGray"))
                                            .frame(width: screenWidth / 5, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.system(size: 40))
                                    }
                                }
                            })
                            .padding(15/2)
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
