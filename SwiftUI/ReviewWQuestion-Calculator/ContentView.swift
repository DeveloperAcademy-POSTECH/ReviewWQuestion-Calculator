//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI


// 색상마다의 클래스 기능을 주게해서 반복을 줄이는 방법

let columns:[GridItem] = [GridItem(), GridItem(), GridItem(), GridItem()]

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black)
            LazyVGrid(columns: columns){
                ForEach(allButtonsArray){ item in
                    ButtonUIView(buttonModel:item)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
