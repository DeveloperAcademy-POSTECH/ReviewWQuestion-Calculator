//
//  ReviewWQuestion_CalculatorApp.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

@main
struct ReviewWQuestion_CalculatorApp: App {
        
    var body: some Scene {
        WindowGroup {
            ContentView(calculateData: calculateData(),operationData: operationData())
        }
    }
}
