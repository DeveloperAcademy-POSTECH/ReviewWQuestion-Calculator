//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var output:Double = 50000.0
    let numberFormatter = NumberFormatter()
    init(){
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 9
//        numberFormatter.maximumFractionDigits = 9
        numberFormatter.maximumIntegerDigits = 9
    }
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
        VStack{
            HStack{
                Spacer()
                Text(numberFormatter.string(from: output as NSNumber)!)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .padding()
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .allowsTightening(true)
            }
            
            Button {
                output += 100000000
                
            } label: {
                Text("1")
                    .foregroundColor(.white)
            }
            

        }
        
    }
        .onAppear {
            //세로모드 고정
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                }.onDisappear {
                    AppDelegate.orientationLock = .all
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

