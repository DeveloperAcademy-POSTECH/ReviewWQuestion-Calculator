//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    var data = CalcButton.calcButtonData
    @State var stack = Stack<String>()  // 여기에 @State 붙여주면 bad access 발생함 이유가 뭐지? 갑자기 잘됨.....


    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(result(stack: stack))
                    .font(.system(size: 90))
                    .minimumScaleFactor(0.5) // 폰트 크기가 절반까지 자동으로 줄어듬
                    .lineLimit(1) // 한줄로 출력
            }
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20 ))
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.3, alignment: .bottomTrailing)
            
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(0..<20) { i in
                    Button(action: {
                        stack.choiceOperator(value: data[i].text)
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



func result(stack: Stack<String>) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 2 // 소수점 2번째 자리까지 출력
    numberFormatter.numberStyle = .decimal // 3자리 마다 콤마
    
    return stack.elements.map{$0}.joined(separator: "").isEmpty ? "0" : numberFormatter.string(for: Double(stack.elements.map{String($0)}.joined(separator: ""))!) ?? "0"
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
