//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct ContentView: View {
    var data = CalcButton.calcButtonData
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            HStack {
//                Text(CalcButton.stack.top()!)
//                    .font(.system(size: 70))
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.3, alignment: .bottomTrailing)
            
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(data, id: \.id) { i in
                    Button(action: {
                        
                    }, label: {
                        CircleButtonView(backgroundColor: i.backgroundColor, text: i.text, textColor: i.textColor)
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













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
