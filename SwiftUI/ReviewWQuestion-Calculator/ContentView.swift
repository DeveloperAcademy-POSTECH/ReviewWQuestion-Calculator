//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI


enum CalculatorButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case AC = "AC"
    case changeSign = "+/-"
    case persent = "%"
    case plus = "+"
    case minus = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case dot = "."
    
    var buttonColor: Color {
        switch self{
        case .AC, .changeSign, .persent:
            return .gray
        case .divide, .multiply, .minus, .plus, .equal:
            return .orange
        default:
            return .gray
            
        }
    }
}
    

struct ContentView: View {
    
    var outputValue: String = "0"
    
    
    let digitButton: [[CalculatorButton]] = [
        [.AC, .changeSign, .persent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .zero, .dot, .equal]
    ]
    
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        //배경을 어떤 방식으로 할 건지도 고민. overlay와 Zstack 고민해보고 정리
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
                    ForEach(digitButton, id: \.self) { row in
                        ForEach(row, id: \.self) { row2 in
                            Button(action: {
                                
                            }, label: {
                                ZStack{
                                    if row2.rawValue == "0" {
                                        RoundedRectangle(cornerRadius: 90)
                                            .foregroundColor(row2.buttonColor)
                                            .frame(width: 180, alignment: .trailing)
                                            .padding(.leading, 100)
                                    } else {
                                        Circle()
                                            .foregroundColor(row2.buttonColor)
                                    }
                                    Text(row2.rawValue)
                                        .foregroundColor(.white)
                                        .font(.system(size: 35))
                                        .frame(width: 80, height: 80, alignment: .center)
                                }
                            })
                        }
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
