//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    var data = CalcButton.calcButtonData
    @State var stack = Stack()  // 여기에 @State 붙여주면 bad access 발생함 이유가 뭐지? 갑자기 잘됨.....
    @State var calcResult = "0"


    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
//                Text(result(stack: stack))
//                    .font(.system(size: 90))
//                    .minimumScaleFactor(0.5) // 폰트 크기가 절반까지 자동으로 줄어듬
//                    .lineLimit(1) // 한줄로 출력
                Text(result(value: calcResult))
                    .font(.system(size: 90))
                    .minimumScaleFactor(0.5) // 폰트 크기가 절반까지 자동으로 줄어듬
                    .lineLimit(1) // 한줄로 출력

            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20 ))
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.3, alignment: .bottomTrailing)
            
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(0..<20) { i in
                    Button(action: {
                        if i == 0 {
                            stack.choiceOperator(value: data[i].text)
                            calcResult = "0"
                        } else if i == 19 {
                            calcResult = postfix(arr: stack.elements)
                        } else {
                            stack.choiceOperator(value: data[i].text)
                        }
                    }, label: {
                        CircleButtonView(backgroundColor: data[i].backgroundColor, text: data[i].text, textColor: data[i].textColor)
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.6)
            Spacer()
        } // VStack`
        .preferredColorScheme(.dark)
        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10 ))
    } // body
} // ContentView



func result(value: String) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 2 // 소수점 2번째 자리까지 출력
    numberFormatter.numberStyle = .decimal // 3자리 마다 콤마
    
    return numberFormatter.string(for: Double(value)) ?? "00"
//    return stack.elements.map{$0}.joined(separator: "").isEmpty ? "0" : numberFormatter.string(for: Double(stack.elements.map{String($0)}.joined(separator: ""))!) ?? "0"
}

func postfix(arr: [String]) -> String{
    var numStack = Stack()
    var opStack = Stack()
    print("arr :  \(arr)")
    for i in 0..<arr.count {
        switch arr[i] {
        case "+","÷","×","−":
            if opStack.isEmpty() {
                print("push \(arr[i])")
                opStack.push(arr[i])
            } else {
                // 1. opStack의 top에 있는 연산자보다 우선순위가 높으면 그냥 push
                // 2. opStack의 top에 있는 연산자보다 우선순위가 낮으면 push하기 전에
                //    numStack에서 값 꺼내서 계산해야함
                // 2-1. 이때 넣으려면 연산자랑 opStack에 있는 연산자랑 같은 우선순위면 좌측
                //      좌측결합이므로 남아있는 연산자도 계산후 결과값을 numStack에 넣음
                // 2-2. 마지막으로 넣으려면 연산자와 숫자를 각 stack 넣어줌
                // 3. 마지막으로 남아있는 연산자를 꺼내서 계산해주고 numStack에 남아있는 1개를 리턴
                var pre = priority(element: opStack.top()!)
                var cur = priority(element: arr[i])
                if pre > cur {
                    opStack.push(arr[i])
                    print("push \(arr[i])")
                } else {
                    while( pre <= cur){
                        //print("while \(opStack.top()!) >= \(arr[i])")
                        let second = numStack.pop()!
                        print(second)
                        let first = numStack.pop()!
                        print(first)
                        switch opStack.pop() {
                        case "+":
                            numStack.push(String(Double(first)! + Double(second)!))
                        case "-":
                            numStack.push(String(Double(first)! - Double(second)!))
                        case "×":
                            numStack.push(String(Double(first)! * Double(second)!))
                        case "÷":
                            numStack.push(String(Double(first)! / Double(second)!))
                        default:
                            print("default")
                        }
                        print("!!!! \(opStack)")
                        if !opStack.isEmpty() {
                            pre = priority(element: opStack.top()!)
                        } 
                        opStack.push(arr[i])
                        print("push \(arr[i])")
                        break
                    }
                }
            }
        case "1","2","3","4","5","6","7","8","9","0":
            numStack.push(arr[i])
            print("push : \(arr[i])")
        default:
            print("default")
        }
    }
    while(!opStack.isEmpty()){
        print("남은거 \(numStack) , \(opStack)")
        var second = numStack.pop()!
        var first = numStack.pop()!
        switch opStack.pop() {
        case "+":
            numStack.push(String(Double(first)! + Double(second)!))
        case "-":
            numStack.push(String(Double(first)! - Double(second)!))
        case "×":
            numStack.push(String(Double(first)! * Double(second)!))
        case "÷":
            numStack.push(String(Double(first)! / Double(second)!))
        default:
            print("default")
        }
        print("while end \(numStack) , \(opStack)")
    }
    return numStack.pop()!
}


func priority(element: String) -> Int{
    switch element {
    case "÷","×":
        return 0
    case "+","−":
        return 1
    default:
        return 999
    }
}


//Cannot use mutating member on immutable value: 'numStack' is a 'let' constant
//func calculate(opStack: Stack<String>, numStack: Stack<String>){
//    var second = numStack.pop()!
//    var first = numStack.pop()!
//    switch opStack.pop() {
//    case "+":
//        numStack.push(String(Double(first)! + Double(second)!))
//    case "-":
//        numStack.push(String(Double(first)! - Double(second)!))
//    case "×":
//        numStack.push(String(Double(first)! * Double(second)!))
//    case "÷":
//        numStack.push(String(Double(first)! / Double(second)!))
//    default:
//        print("default")
//    }
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
