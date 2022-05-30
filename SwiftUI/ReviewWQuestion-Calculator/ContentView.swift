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
    @State var outPut:Double = 0
    @State var outputString  : String = "0"
    @State var isTouched = false
    @State var isDot = false
    @State var isonDot = false
    let buttons : [[Buttons]] = [[.clear,.opposite,.percentage,.divide],[.seven,.eight,.nine,.multiple],[.four,.five,.six,.minus],[.one,.two,.three,.plus],[.zero,.dot,.equal]]
    
    
    let numberFormatter1 = NumberFormatter()
    init(){
        numberFormatter1.maximumFractionDigits = 9
    }
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(formatDouble(str: outputString))
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
                                btnAction(button: btn)
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
    func formatDouble(str: String)->String{
        let number = Double(str)!
        
        if ((abs(number) > 999999999 || abs(number)<0.00000001) && number != 0 ){
            let formatter = NumberFormatter()
            formatter.numberStyle = .scientific
            formatter.positiveFormat = "0.#####E0"
            formatter.exponentSymbol = "e"
            
            return formatter.string(from: number as NSNumber)!
        }
        else if(number<1000){
            let numberFormatter = NumberFormatter()
            
            return str
        }
        else{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumSignificantDigits = 9
            //numberFormatter.maximumFractionDigits = 9
            numberFormatter.maximumIntegerDigits = 9
            return numberFormatter.string(from: number as NSNumber)!
        }
    }
    
    
    func btnAction(button: Buttons){
        switch button{
        case .divide:
            break
        case .minus:
            break
        case .plus:
            break
        case .equal:
            break
        case .multiple:
            break
        case .percentage:
            break
        case .opposite:
            break
        case .clear:
            outputString = "0"
            isDot = false
        case .dot:
            if !isDot{
                isDot = true
                outputString.append(contentsOf: ".")
            }
            
        default:
            if (outputString == "0") {
                outputString = button.rawValue
            }
            else {
                if (((abs(Double(outputString + button.rawValue)!.exponent) > 999999999) || (abs(Double(outputString + button.rawValue)!) < 0.00000001)) && (outputString != "0")){
                    print(outputString)
                    break
                }
                else{
                    outputString.append(contentsOf: button.rawValue)
                   
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

