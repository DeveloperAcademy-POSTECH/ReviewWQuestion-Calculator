//
//  ReviewWQuestion_CalculatorApp.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

@main
struct CalculationApp: App {
    @StateObject var calculationData = CalculationData()
    var body: some Scene {
        WindowGroup {
            CalculationView()
                .environmentObject(calculationData)
        }
    }
}
