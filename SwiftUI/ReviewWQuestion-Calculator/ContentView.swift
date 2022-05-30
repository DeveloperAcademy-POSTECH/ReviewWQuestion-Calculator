//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI


//enum CalculatorButton: String {
//    case zero = "0"
//    case one = "1"
//    case two = "2"
//    case three = "3"
//    case four = "4"
//    case five = "5"
//    case six = "6"
//    case seven = "7"
//    case eight = "8"
//    case nine = "9"
//    case AC = "AC"
//    case C = "C"
//    case changeSign = "-/+"
//    case persent = "%"
//    case plus = "+"
//    case minus = "-"
//    case divide = "/"
//    case multiply = "x"
//    case equal = "="
//    case dot = "."
//}
    

struct ContentView: View {
    
    var outputValue: String = "0"
    
//    let roundButton: [CalculatorButton] = [
//        .AC, .changeSign, .persent, .divide, .seven, .eight, .nine, .multiply, .four, .five, .six, .minus, .zero, .dot, .equal
//    ]
    
    let calculatorDigit = ["AC", "+/-", "%", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]
    
    let columns = [
        GridItem(.adaptive(minimum: 80))]

    var body: some View {
        //배경을 어떤 방식으로 할 건지도 고민. overlay와 Zstack을 고민해볼것
//        Color.black
//            .ignoresSafeArea()
        ZStack{
            Color.black
                .ignoresSafeArea()
            /*Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'CalculatorButton' conform to 'Identifiable'
             위 오류와 id를 적어야 하는 이유는 뭘까?
             */
            VStack{
                Text("\(outputValue)")
                    .foregroundColor(.white)
                    .font(.system(size: 90))
                LazyVGrid(columns: columns, spacing: 15) {
                    //rawvalue 공부할 것
                    ForEach(calculatorDigit, id: \.self) { i in
                        Text(i)
                            .foregroundColor(.white)
                    }
                }
            }

            
            
        }
       
    }
}

//
//private func numberButton(_ number: Int) -> Button<Text>{
//    Button(action: <#T##() -> Void#>) {
//        Circle()
//            .frame(width: 80, height: 80)
//            .foregroundColor(.gray)
//    }
//
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
