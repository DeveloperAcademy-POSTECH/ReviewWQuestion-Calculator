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
    case none = ""
    
    var buttonColor: Color {
        switch self{
        case .AC, .changeSign, .persent:
            return Color("signColorGray")
        case .divide, .multiply, .minus, .plus, .equal:
            return .orange
        default:
            return Color("digitColorGray")
        }
    }
}
    
enum Operation {
    case plus, minus, multiply, divide, none
}

struct ContentView: View {
    
    @State var currentValue: String = "0"
    @State var nextValue: Int = 0
    @State var currentOperation: Operation = .none
    
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
                HStack{
                    Spacer()
                    Text("\(currentValue)")
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                }
                .padding(20)
                LazyVGrid(columns: columns, spacing: 15) {
                    //rawvalue 공부할 것
                    ForEach(digitButton, id: \.self) { row in
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                switch item {
                                case .plus, .minus, .multiply, .divide, .equal:
                                    if item == .plus {
                                        currentOperation = .plus
                                        nextValue = Int(currentValue) ?? 0
                                    } else if item == .minus {
                                        currentOperation = .minus
                                        nextValue = Int(currentValue) ?? 0
                                    } else if item == .multiply {
                                        currentOperation = .multiply
                                        nextValue = Int(currentValue) ?? 0
                                    } else if item == .divide {
                                        currentOperation = .divide
                                        nextValue = Int(currentValue) ?? 0
                                    } else if item == .equal {
                                        let current = Int(currentValue) ?? 0
                                        let next = nextValue
                                        switch currentOperation {
                                        case .plus:
                                            currentValue = "\(next + current)"
                                        case .minus:
                                            currentValue = "\(next - current)"
                                        case .multiply:
                                            currentValue = "\(next * current)"
                                        case .divide:
                                            currentValue = "\(next / current)"
                                        case .none:
                                            break
                                        }
                                    }
                                    if item != .equal {
                                        //0이 아닌 이전의 값을 그대로 유지하려면?
                                        currentValue = "0"
                                    }
                                    
                                case .AC:
                                    currentValue = "0"
                                case .dot, .changeSign, .persent:
                                    if item == .changeSign{
                                        let current = -(Int(currentValue) ?? 0)
                                        currentValue = "\(current)"
                                    }
                                    break
                                default:
                                    let number = item.rawValue
                                    if self.currentValue == "0" {
                                        currentValue = number
                                    } else {
                                        currentValue = "\(currentValue)\(number)"
                                    }
                                }
                            }, label: {
                                ZStack{
                                    if item.rawValue == "0" {
                                        RoundedRectangle(cornerRadius: 90)
                                            .foregroundColor(item.buttonColor)
                                            .frame(width: 180, alignment: .trailing)
                                            .padding(.leading, 100)
                                    } else {
                                        Circle()
                                            .foregroundColor(item.buttonColor)
                                    }
                                    Text(item.rawValue)
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
