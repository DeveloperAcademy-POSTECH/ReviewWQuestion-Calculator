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
    
    
    
    
    var displayNumber = ""
    var firstNumber = ""
    var secondNumber = ""
    var result = ""
    var currentOperation: Operation = .unknown
    // 아무 연산도 하지 않는 상태
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        //print("sender currentTitle : ", sender.currentTitle)
        guard let number = sender.titleLabel?.text else { return }
        // sender.title 로 접근하면 오류가 발생했다
        // sender.titleLabel?.text로 오류 해결
        print("number is : ", number)
        displayNumber += number
        calculatorResultLabel.text! = displayNumber
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !displayNumber.isEmpty {
                secondNumber = displayNumber
                displayNumber = ""
                
                guard let firstNumber = Double(firstNumber) else { return }
                guard let secondNumber = Double(secondNumber) else { return }
                
                switch currentOperation {
                case .add:
                    result = "\(firstNumber + secondNumber)"
                case .subtract:
                    result = "\(firstNumber - secondNumber)"
                case .multiply:
                    result = "\(firstNumber * secondNumber)"
                case .divide:
                    result = "\(firstNumber / secondNumber)"
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
        operation(currentOperation)
    }
    

    
    @IBAction func pressDot(_ sender: UIButton) {
        
    }
    
    
}

