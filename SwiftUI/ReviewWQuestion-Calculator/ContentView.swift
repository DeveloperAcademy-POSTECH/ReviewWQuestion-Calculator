//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State var currentNumber: Int = 0
    @State var previousNumber: Int = 0
    @State var selectedCurrentOperator: String = ""
    @State var selectedPreviousOperator: String = ""
    @State var divideBy0: Bool = false
    
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
                
                Text(divideBy0 ? "오류" : String(currentNumber))
                    .foregroundColor(.white)
                    .font(.system(size: 93, weight: .light))
                    .padding(.horizontal, 17)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                ForEach(keypads, id: \.self) { keypads in
                    HStack(spacing: 0) {
                        ForEach(keypads, id: \.self) { keypad in
                            Button(action: {
                                switch keypad {
                                case "0":
                                    if currentNumber != 0 {
                                        if selectedCurrentOperator != "" {
                                            currentNumber = 0
                                            selectedPreviousOperator = selectedCurrentOperator
                                            selectedCurrentOperator = ""
                                        }
                                        if divideBy0 {
                                            currentNumber = 0
                                            divideBy0 = false
                                        }
                                        currentNumber = Int(String(currentNumber) + keypad)!
                                    }
                                case "%":
                                    currentNumber /= 100
                                case "+/-":
                                    currentNumber = -currentNumber
                                case "AC":
                                    if currentNumber != 0 {
                                        currentNumber = 0
                                    }
                                    else {
                                        divideBy0 = false
                                        previousNumber = 0
                                    }
                                case "÷", "×", "−", "+":
                                    previousNumber = currentNumber
                                    selectedCurrentOperator = keypad
                                case "=":
                                    if selectedPreviousOperator == "+" {
                                        currentNumber += previousNumber
                                    }
                                    else if selectedPreviousOperator == "−" {
                                        currentNumber = previousNumber - currentNumber
                                    }
                                    else if selectedPreviousOperator == "×" {
                                        currentNumber *= previousNumber
                                    }
                                    else if selectedPreviousOperator == "÷" {
                                        if currentNumber == 0 {
                                            divideBy0 = true
                                        }
                                        else {
                                            currentNumber = previousNumber / currentNumber
                                        }
                                    }
                                case ".":
                                    print(currentNumber)
                                    print(previousNumber)
                                    print(selectedCurrentOperator)
                                    print(selectedPreviousOperator)
                                default:
                                    if selectedCurrentOperator != "" {
                                        currentNumber = 0
                                        selectedPreviousOperator = selectedCurrentOperator
                                        selectedCurrentOperator = ""
                                    }
                                    if divideBy0 {
                                        currentNumber = 0
                                        divideBy0 = false
                                    }
                                    currentNumber = Int(String(currentNumber) + keypad)!
                                }
                            }, label: {
                                switch keypad {
                                case "0":
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(Color("DarkGray"))
                                            .frame(width: (screenWidth / 5) * 2 + 15, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(.white)
                                            .font(.system(size: 40))
                                            .padding(.leading, screenWidth / 13)
                                    }
                                case "AC":
                                    ZStack {
                                        Circle()
                                            .fill(.gray)
                                            .frame(width: screenWidth / 5, height: screenWidth / 5)
                                        Text(previousNumber == 0 ? keypad : "C")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                    }
                                case "+/-", "%":
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
                                            .fill(selectedCurrentOperator == keypad ? .white : .orange)
                                            .frame(width: screenWidth / 5, height: screenWidth / 5)
                                        Text(keypad)
                                            .foregroundColor(selectedCurrentOperator == keypad ? .black : .white)
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
            .padding(.bottom, 40)
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
