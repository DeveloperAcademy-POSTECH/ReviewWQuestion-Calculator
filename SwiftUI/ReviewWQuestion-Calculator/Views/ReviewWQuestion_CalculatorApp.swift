//
//  ReviewWQuestion_CalculatorApp.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

@main

struct ReviewWQuestion_CalculatorApp: App {
        
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    var body: some Scene {
        WindowGroup {
            ContentView(calculateData: calculateData(),operationData: operationData())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
