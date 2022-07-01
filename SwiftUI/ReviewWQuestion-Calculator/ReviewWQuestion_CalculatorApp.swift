//
//  ReviewWQuestion_CalculatorApp.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

@main
struct ReviewWQuestion_CalculatorApp: App {
    @StateObject var resultNumberClass:ResultNumber = ResultNumber()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(resultNumberClass)
        }
    }
}
