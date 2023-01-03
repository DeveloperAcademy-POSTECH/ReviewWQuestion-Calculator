import SwiftUI

enum MainCalculation: String, CaseIterable {
    case division = "÷"
    case multiplication = "×"
    case subtraction = "-"
    case addition = "+"
    case result = "﹦"
}

enum SubCalculationCase: String, CaseIterable {
    case clear = "C"
    case plusMinus = "+/-"
    case percentage = "%"
}

enum Numbers : Int, CaseIterable {
    case seven = 7
    case eight = 8
    case nine = 9
    case four = 4
    case five  = 5
    case six = 6
    case one = 1
    case two = 2
    case three = 3
}
