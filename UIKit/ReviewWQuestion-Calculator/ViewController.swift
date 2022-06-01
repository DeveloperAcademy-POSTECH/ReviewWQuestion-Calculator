//
//  ViewController.swift
//  ReviewWQuestion-Calculator
//

import UIKit
import Foundation

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorResultLabel: UILabel!
    
    @IBOutlet weak var allClearLabel: UIButton!
    // 프로퍼티
    var displayNumber = ""
    var firstNumber = ""
    var secondNumber = ""
    var result = ""
    var currentOperation: Operation = .unknown
    // 아무 연산도 하지 않는 상태
    
    var operatorStack: [Operation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorResultLabel.adjustsFontSizeToFitWidth = true
    }
    

    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        acTransition()
        guard let number = sender.titleLabel?.text else { return }
        // sender.title 로 접근하면 오류가 발생했다
        // sender.titleLabel?.text로 오류 해결
        
        displayNumber += number
        
        calculatorResultLabel.text = numberFormatter(displayNumber)
    }
    
    // 이해가 필요한 코드
    func numberFormatter(_ number: String) -> String? {
        guard let newNumber = Double(number) else {return nil}
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: newNumber))
    }
    
    func roundDouble(_ number : String) -> String {
        return String(format: "%.3f", number)
        
    }
    
    // 계산할 메서드 (파라미터로 enum의 연산 종류를 받는다)
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !displayNumber.isEmpty {
                secondNumber = displayNumber
                displayNumber = ""
                
                guard let firstNumber = Double(firstNumber) else { return }
                guard let secondNumber = Double(secondNumber) else { return }
                
                switch currentOperation {
                case .add:
                    operatorStack.append(.add)
                    result = "\(firstNumber + secondNumber)"
                case .subtract:
                    operatorStack.append(.subtract)
                    result = "\(firstNumber - secondNumber)"
                case .multiply:
                    operatorStack.append(.multiply)
                    result = "\(firstNumber * secondNumber)"
                case .divide:
                    if secondNumber == 0 {
                        result = "오류"
                    }
                    else {
                        operatorStack.append(.divide)
                        result = "\(firstNumber / secondNumber)"
                    }
                default:
                    break
                }

            
            // 연산은 다 했고 이제 출력할거야
            // 결과값이 정수이면 Int 형으로 출력한다
                
                if let result = Double(result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Double(result))"
                }
                
                self.firstNumber = self.result
                calculatorResultLabel.text = numberFormatter(self.result)
            }
            currentOperation = operation
            
        }
        else {
            firstNumber = displayNumber
            currentOperation = operation
            displayNumber = ""
        }
    }

    func acTransition() {
        // 연산을 시작하면 AC가 C로 바뀐다
        if !displayNumber.isEmpty {
            allClearLabel.titleLabel?.text = "C"
            allClearLabel.titleLabel?.textAlignment = .center
        } else {
            allClearLabel.titleLabel?.text = "AC"
            allClearLabel.titleLabel?.textAlignment = .center

        }
    }
    
    @IBAction func pressAdd(_ sender: UIButton) {
        operation(.add)
    }
    
    @IBAction func pressSub(_ sender: UIButton) {
        operation(.subtract)
    }
    
    @IBAction func pressMultiply(_ sender: UIButton) {
        operation(.multiply)
    }
    
    @IBAction func pressDiv(_ sender: UIButton) {
        operation(.divide)
    }
    
    @IBAction func pressEqual(_ sender: UIButton) {
        if !secondNumber.isEmpty {
            operatorStack.append(currentOperation)
            operation(currentOperation)
            
            displayNumber = result
            guard let commaResult = numberFormatter(displayNumber) else {return}
            if commaResult.contains(".") {
                //guard let roundedDouble = roundDouble(commaResult) else {return}
                calculatorResultLabel.text = roundDouble(commaResult)
            } else {
                calculatorResultLabel.text = commaResult
            }
            
        } else {
            operation(currentOperation)
        }
    }
    
    @IBAction func pressDot(_ sender: UIButton) {
        displayNumber += displayNumber.isEmpty ? "0." : "."
        calculatorResultLabel.text = displayNumber
    }
    
    @IBAction func pressClearButton(_ sender: UIButton) {
        displayNumber.removeAll()
        firstNumber.removeAll()
        secondNumber.removeAll()
        currentOperation = .unknown
        calculatorResultLabel.text = "0"
        acTransition()
    }
    
}

