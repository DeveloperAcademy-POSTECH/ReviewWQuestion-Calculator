import SwiftUI

// UI 색상 extension
extension Color {
    static let mainCalButtonColor = Color(hex: "#F1A33B")
    static let subCalButtonColor = Color(hex: "#A5A5A5")
    static let numberButtonColor = Color(hex: "#333333")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        let _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

//MARK: localized string key를 string으로 바꿔주는 함수 
extension LocalizedStringKey {
    
    public func toString() -> String {
        let mirror = Mirror(reflecting: self)
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }
        if(attributeLabelAndValue != nil) {
            return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}
