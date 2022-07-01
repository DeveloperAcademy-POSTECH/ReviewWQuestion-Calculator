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
        case .equal:
            return Color.orange
        case .divide,.multiple,.minus,.plus:
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
    @State var outputString  : String = "0"
    @State var isTouched = false
    @State var isDot = false
    @State var clearToken = false
    @State var numbervalue = ""
    @State var operationvalue = ""
    @State var recentvalue = ""
    @State var clearToggle = false
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
                            var toggle = false
                            Button {
                                btnAction(button: btn)
                                toggle.toggle()
                            } label: {
                                switch btn {
                                case .clear:
                                    Text(clearToggle ? " C" : btn.rawValue)
                                        .font(.system(size: 40, weight: .bold))
                                        .frame(width: btn.btnwidth, height: btn.btnheight, alignment: .leading)
                                        .foregroundColor(btn.foreColor)
                                        .padding(.leading,btn.leadingpadding)
                                        .background(btn.bgColor)
                                        .cornerRadius(100)
                                        .padding(.horizontal, btn.zeropadding)
                                        .padding(.vertical, 3.0)
                                default:
                                    Text(btn.rawValue)
                                        .font(.system(size: 40, weight: .bold))
                                        .frame(width: btn.btnwidth, height: btn.btnheight, alignment: .leading)
                                        .foregroundColor(btn.foreColor)
                                        .padding(.leading,btn.leadingpadding)
                                        .background(btn.bgColor)
                                        .cornerRadius(100)
                                        .padding(.horizontal, btn.zeropadding)
                                        .padding(.vertical, 3.0)
                                }
                                
                                
                                
                                
                                
                                
                            }
                            
                            
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
        //        if str.hasPrefix("0.0"){
        //            print("here")
        //            return str
        //        }
        if str == "ERROR"{
            return str
        }
        else if str == "-0"{
            return str
        }
        else{
            let number = Double(str)!
            print(number)
            if ((abs(number) > 999999999 || abs(number)<0.00000001) && number != 0 ){
                let formatter = NumberFormatter()
                formatter.numberStyle = .scientific
                formatter.positiveFormat = "0.#####E0"
                formatter.exponentSymbol = "e"
                return formatter.string(from: number as NSNumber)!
            }
            else if(abs(number)<1000){
                return str
            }
            else{
                
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.maximumSignificantDigits = 9
                //numberFormatter.maximumFractionDigits = 9
                numberFormatter.maximumIntegerDigits = 9
                if str.hasSuffix("."){
                    return numberFormatter.string(from: number as NSNumber)! + "."
                }
                else {
                    return numberFormatter.string(from: number as NSNumber)!
                }
            }
        }
    }
    
    
    func btnAction(button: Buttons){
        switch button{
        case .divide:
            numbervalue = outputString
            operationvalue = "/"
            outputString = "0"
            recentvalue = ""
            isDot = false
        case .minus:
            numbervalue = outputString
            operationvalue = "-"
            outputString = "0"
            recentvalue = ""
            isDot = false
        case .plus:
            numbervalue = outputString
            operationvalue = "+"
            outputString = "0"
            recentvalue = ""
            isDot = false
        case .equal:
            isDot = false
            equal()
        case .multiple:
            numbervalue = outputString
            operationvalue = "x"
            outputString = "0"
            recentvalue = ""
            isDot = false
        case .percentage:
            let numberFormatter2 = NumberFormatter()
            numberFormatter2.maximumFractionDigits=160
            outputString = numberFormatter2.string(from: Double(outputString)! * 0.01 as NSNumber)!
        case .opposite:
            if outputString.hasPrefix("-"){
                outputString.remove(at: outputString.startIndex)
            }
            else{
                outputString = "-"+outputString
            }
        case .clear:
            outputString = "0"
            numbervalue = ""
            operationvalue = ""
            recentvalue = ""
            isDot = false
            clearToggle = false
        case .dot:
            if !isDot{
                isDot = true
                outputString.append(contentsOf: ".")
            }
            //숫자 입력시
        default:
            if clearToken{
                outputString = "0"
                clearToken.toggle()
            }
            if (outputString == "0") {
                outputString = button.rawValue
                
            }
            else {
                if (((abs(Double(outputString + button.rawValue)!) > 999999999)) && (outputString != "0")){
                    break
                }
                else{
                    
                    outputString.append(contentsOf: button.rawValue)
                    
                }
            }
            clearToggle = true
        }
    }
    
    func equal(){
        if (operationvalue == "-"){
            if outputString == "ERROR"{
                outputString = "0"
            }
            else{
                var savestring = outputString
                outputString = numberFormatter1.string(from:Double(recentvalue == "" ? numbervalue : outputString)!-Double(recentvalue == "" ? outputString : recentvalue)! as NSNumber)!
                numbervalue = outputString
                if recentvalue == ""{
                    recentvalue = savestring
                }
            }
        }
        else if(operationvalue == "+"){
            if outputString == "ERROR"{
                outputString = "0"
            }
            else{
                var savestring = outputString
                outputString = numberFormatter1.string(from:Double(recentvalue == "" ? numbervalue : outputString)!+Double(recentvalue == "" ? outputString : recentvalue)! as NSNumber)!
                numbervalue = outputString
                if recentvalue == ""{
                    recentvalue = savestring
                }
            }
        }
        else if(operationvalue == "/"){
            if outputString == "ERROR"{
                outputString = "0"
            }
            else if(outputString == "0"){
                outputString = "ERROR"
            }
            else{
                let numberFormatter2 = NumberFormatter()
                numberFormatter2.maximumFractionDigits=2
                var savestring = outputString
                outputString = numberFormatter2.string(from:Double(recentvalue == "" ? numbervalue : outputString)!/Double(recentvalue == "" ? outputString : recentvalue)! as NSNumber)!
                numbervalue = outputString
                if recentvalue == ""{
                    recentvalue = savestring
                }
            }
        }
        else if(operationvalue == "x"){
            if outputString == "ERROR"{
                outputString = "0"
            }
            else{
                var savestring = outputString
                outputString = numberFormatter1.string(from:Double(recentvalue == "" ? numbervalue : outputString)!*Double(recentvalue == "" ? outputString : recentvalue)! as NSNumber)!
                numbervalue = outputString
                if recentvalue == ""{
                    recentvalue = savestring
                }
            }}
        clearToken = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

