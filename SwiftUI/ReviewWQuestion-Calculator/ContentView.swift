//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    private let keypads: [[String]] = [
        ["AC", "P&M", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
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
                                if keypad == "0" {
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(.gray)
                                            .frame(width: 174,height: 80)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .padding(.leading, 32)
                                    }
                                }
                                else {
                                    ZStack {
                                        Circle()
                                            .fill(.gray)
                                            .frame(width: 80, height: 80)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.title)
                                    }
                                }
                            })
                            .padding(7)
                        }
                    }
                }
            }
            .padding(.horizontal, 17)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
