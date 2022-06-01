//
//  ViewController.swift
//  ReviewWQuestion-Calculator
//

import UIKit

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorResultLabel: UILabel!
    
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
        
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        //print("sender currentTitle : ", sender.currentTitle)
        
        guard let number = sender.titleLabel?.text else { return }
        // sender.title 로 접근하면 오류가 발생했다
        // sender.titleLabel?.text로 오류 해결
        
        displayNumber += number
        calculatorResultLabel.text! = numberFormatter(Int(displayNumber)!)
    }
    
    func numberFormatter(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    // 계산할 메서드
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
                    result = "\(firstNumber - secondNumber)"
                case .multiply:
                    result = "\(firstNumber * secondNumber)"
                case .divide:
                    if secondNumber == 0 {
                        result = "오류"
                    }
                    else {
                        result = "\(firstNumber / secondNumber)"
                    }
                default:
                    break
                }
                
                // 결과값이 정수이면 Int 형으로 출력한다
                if (Double(result) ?? 0).truncatingRemainder(dividingBy: 1) == 0 {
                    // %를 쓰니 unavailable 하다고 뜬다
                    result = "\(Int(result))"
                    calculatorResultLabel.text = result
                }
            }
        }
        else {
            firstNumber = displayNumber
            currentOperation = operation
            displayNumber = ""
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
        let lastOperation = operatorStack.last ?? currentOperation
        operation(lastOperation)
        
        
    }
    
    @IBAction func pressDot(_ sender: UIButton) {
        displayNumber += displayNumber.isEmpty ? "0." : "."
        calculatorResultLabel.text = displayNumber
    }
    
    @IBAction func pressClearButton(_ sender: UIButton) {
        if !displayNumber.isEmpty {
            sender.titleLabel?.text = "C"
        }
    }
    
}

