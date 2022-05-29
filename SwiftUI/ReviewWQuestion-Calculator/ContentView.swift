//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI
import Foundation

enum Buttons : String{
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
    case plus = "+"
    case minus = "ㅡ"
    case equal = "="
    case divide = "/"
    case multiple = "X"
    case dot = "."
    case percentage = "%"
    case clear = "AC"
    case opposite = "+/-"
    
    var bgColor : Color {
        switch self{
        case .clear,.opposite,.percentage:
            return Color.gray
        case .divide,.multiple,.minus,.plus,.equal:
            return Color.orange
        default:
            return Color("btncolor")       }
    }
    
    var foreColor : Color {
        switch self{
        case .clear,.opposite,.percentage:
            return Color.black
        default:
            return Color.white        }
    
    }
    
    var btnwidth : CGFloat {
        switch self{
        case .zero:
            return UIScreen.main.bounds.width / 32 * 14 - 30
        case .clear,.opposite:
            return UIScreen.main.bounds.width / 32 * 7 - 15
        case .percentage :
            return UIScreen.main.bounds.width / 32 * 7 - 25
        case .divide :
            return UIScreen.main.bounds.width / 32 * 7 - 35
        case .minus :
            return UIScreen.main.bounds.width / 32 * 7 - 25
        default:
            return UIScreen.main.bounds.width / 32 * 7 - 30}
    
    }
    var btnheight : CGFloat { UIScreen.main.bounds.width / 32 * 7}
    var zeropadding : CGFloat {
        switch self{
        case .zero:
            return 6.0
        default:
            return 2.0 }
    
    }
    var leadingpadding : CGFloat {
    switch self{
    case .clear,.opposite :
        return 15
    case .percentage:
        return 25
    case .divide :
        return 35
    case .minus :
        return 25
    default :
        return 30
        }
    }
}



struct ContentView: View {
    @State var outPut:Double = 0.0
    let buttons : [[Buttons]] = [[.clear,.opposite,.percentage,.divide],[.seven,.eight,.nine,.multiple],[.four,.five,.six,.minus],[.one,.two,.three,.plus],[.zero,.dot,.equal]]
    
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
            Spacer()
            HStack{
                Spacer()
                Text(numberFormatter.string(from: outPut as NSNumber)!)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .padding()
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .allowsTightening(true)
            }
            ForEach(buttons,id: \.self){row in
                HStack{
                    ForEach(row,id:\.self){btn in
                        Button {
                            print(btn.rawValue)
                        } label: {
                            Text(btn.rawValue)
                                .font(.system(size: 40, weight: .bold))
                                .frame(width: btn.btnwidth, height: btn.btnheight, alignment: .leading)
                            
                        }
                        
                        .foregroundColor(btn.foreColor)
                        .padding(.leading,btn.leadingpadding)
                        .background(btn.bgColor)
                        .cornerRadius(100)
                        .padding(.horizontal, btn.zeropadding)
                        .padding(.vertical, 3.0)
                        
                }
                }
                .padding(.horizontal, 6)
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

