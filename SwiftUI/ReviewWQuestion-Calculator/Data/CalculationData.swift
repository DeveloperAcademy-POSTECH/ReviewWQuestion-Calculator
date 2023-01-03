import SwiftUI

final class CalculationData : ObservableObject {
    @Published var displayData : String = ""
    @Published var firstData : Double = 0
    @Published var temporaryData : Double = 0
    @Published var finalData : Double = 0
    @Published var operation : String = ""
    @Published var isMinus : Bool = false
    @Published var isTapped : Bool = false
    @Published var isReceived : Bool = false
    @Published var buttonIndex : String = ""
    let error : LocalizedStringKey = "error"
    
}

func calculations(sign : String, a: Double, b: Double) -> Double {
    var result : Double = 0
    
    switch sign {
    case "+" :
        result = addition(a, b)
    case "-" :
        result = subtraction(a, b)
    case "×" :
        result = multiplication(a, b)
    case "÷" :
        result = division(a, b)
        
    default :
        print("Nothing")
    }
    return result
}

func addition(_ a : Double, _ b : Double) -> Double {
    return a+b
}

func subtraction(_ a : Double, _ b : Double) -> Double {
    return a-b
}

func multiplication(_ a : Double, _ b : Double) -> Double {
    return a*b
}

func division(_ a : Double, _ b : Double) -> Double {
    return round(( (a/b) * 100 )) / 100
}

