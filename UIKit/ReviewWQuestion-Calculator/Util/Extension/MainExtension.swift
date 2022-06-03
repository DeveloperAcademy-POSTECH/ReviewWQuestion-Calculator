//
//  MainExtension.swift
//  ReviewWQuestion-Calculator
//
//  Created by 김상현 on 2022/05/28.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}


extension String {
// MARK: <,> 기호 찍는 함수
    func comma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let resultInteger = numberFormatter.string(from: NSNumber(value: Int(self) ?? 0)) else {
            return ""
        }
        return resultInteger
    }
}
