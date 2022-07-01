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

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorResultLabel: UILabel!
    
    @IBOutlet weak var allClearLabel: UIButton!
    // 프로퍼티
    var displayNumber: String = ""
    var firstNumber: String = ""
    var secondNumber: String = ""
    var result: String = ""
    var currentOperation: Operation = .unknown
    // 아무 연산도 하지 않는 상태
    let errorMessage: String = "오류"
    // 연산자를 저장하는 배열
    var operatorArray: [Operation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorResultLabel.adjustsFontSizeToFitWidth = true
        acTransition()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        acTransition()
        guard let number = sender.titleLabel?.text else { return }
        // sender.title 로 접근하면 오류가 발생했다
        // sender.titleLabel?.text로 오류 해결
        
        displayNumber += number
        
        calculatorResultLabel.text = numberFormatter(displayNumber)
    }
    
    // 세 자리 수마다 콤마를 찍어준다
    func numberFormatter(_ number: String) -> String? {
        guard let newNumber = Double(number) else {return nil}
        // 반환 타입이 옵셔널이어야 오류가 뜨지 않는다.
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
                    operatorArray.append(.add)
                    result = "\(firstNumber + secondNumber)"
                case .subtract:
                    operatorArray.append(.subtract)
                    result = "\(firstNumber - secondNumber)"
                case .multiply:
                    operatorArray.append(.multiply)
                    result = "\(firstNumber * secondNumber)"
                case .divide:
                    if secondNumber == 0 {
                        result = "오류"
                    }
                    else {
                        operatorArray.append(.divide)
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
    
    // 연산자를 탭 하는 경우
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
        if !secondNumber.isEmpty { // 두번째 피연산자가 있는 경우
            // operatorStack.append(currentOperation)
            operation(currentOperation)
            
            displayNumber = result
            
            if displayNumber == errorMessage {
                calculatorResultLabel.text = errorMessage
            } else {
                guard let commaResult = numberFormatter(displayNumber) else {return}
                if commaResult.contains(".") {
                    calculatorResultLabel.text = roundDouble(commaResult)
                } else {
                    calculatorResultLabel.text = commaResult
                }
            }
            
        } else {
            operation(currentOperation)
        }
    }
    
    @IBAction func pressDot(_ sender: UIButton) {
        displayNumber += displayNumber.isEmpty ? "0." : "."
        calculatorResultLabel.text = numberFormatter(displayNumber)
    }
    
    @IBAction func pressClearButton(_ sender: UIButton) {
        displayNumber.removeAll()
        firstNumber.removeAll()
        secondNumber.removeAll()
        currentOperation = .unknown
        calculatorResultLabel.text = "0"
    }
}


