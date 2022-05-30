//
//  ViewController.swift
//  ReviewWQuestion-Calculator
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var ACButton: UIButton!
    @IBOutlet var plusMinusButton: UIButton!
    @IBOutlet var percentButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var equalButton: UIButton!
    @IBOutlet var dotButton: UIButton!
    @IBOutlet var num0Button: UIButton!
    @IBOutlet var num1Button: UIButton!
    @IBOutlet var num2Button: UIButton!
    @IBOutlet var num3Button: UIButton!
    @IBOutlet var num4Button: UIButton!
    @IBOutlet var num5Button: UIButton!
    @IBOutlet var num6Button: UIButton!
    @IBOutlet var num7Button: UIButton!
    @IBOutlet var num8Button: UIButton!
    @IBOutlet var num9Button: UIButton!
    @IBOutlet var resultLabel: UILabel!
    var arithmeticOperation = ArithmeticOperation()
    var output = Output()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setResultLabel()
        setButtonCornerRadius()
        
        func setResultLabel() {
        }
        
        func setButtonCornerRadius() {
            ACButton.cornerRadius = ACButton.layer.frame.width * 0.5
            plusMinusButton.cornerRadius = plusMinusButton.layer.frame.width * 0.5
            percentButton.cornerRadius = percentButton.layer.frame.width * 0.5
            divideButton.cornerRadius = divideButton.layer.frame.width * 0.5
            multiplyButton.cornerRadius = multiplyButton.layer.frame.width * 0.5
            minusButton.cornerRadius = minusButton.layer.frame.width * 0.5
            plusButton.cornerRadius = plusButton.layer.frame.width * 0.5
            equalButton.cornerRadius = equalButton.layer.frame.width * 0.5
            dotButton.cornerRadius = dotButton.layer.frame.width * 0.5
            num0Button.cornerRadius = num0Button.layer.frame.width * 0.25
            num1Button.cornerRadius = num1Button.layer.frame.width * 0.5
            num2Button.cornerRadius = num2Button.layer.frame.width * 0.5
            num3Button.cornerRadius = num3Button.layer.frame.width * 0.5
            num4Button.cornerRadius = num4Button.layer.frame.width * 0.5
            num5Button.cornerRadius = num5Button.layer.frame.width * 0.5
            num6Button.cornerRadius = num6Button.layer.frame.width * 0.5
            num7Button.cornerRadius = num7Button.layer.frame.width * 0.5
            num8Button.cornerRadius = num8Button.layer.frame.width * 0.5
            num9Button.cornerRadius = num9Button.layer.frame.width * 0.5
        }
    }
    
    @IBAction func onTapClearButton(_ sender: Any) {
        self.arithmeticOperation = ArithmeticOperation()
        self.output = Output()
        resultLabel.text = "0"
    }
    
    @IBAction func onTapEqualButton(_ sender: Any) {
        //  if arithmeticOperation.operation == nil { return }
        let num = output.getOutputNum()
        arithmeticOperation.inputNum(num)

        // 결과값 출력
        let resultNum = arithmeticOperation.leftPort // arithmeticOperation.operate()
        output.updateWithNum(resultNum)
        resultLabel.text = output.getOutputText()

        self.output = Output()
        self.arithmeticOperation = ArithmeticOperation(leftPort: resultNum, operation: .progress)
    }
    
    @IBAction func onTapPlusButton(_ sender: Any) {
        let num = output.getOutputNum()
        arithmeticOperation.inputNum(num)
        arithmeticOperation.operation = .plus
                
        // 결과값 출력
        let resultNum = arithmeticOperation.leftPort
        output.updateWithNum(resultNum)
        resultLabel.text = output.getOutputText()
        
        self.output = Output()
    }
    
    @IBAction func onTapMinusButton(_ sender: Any) {
        let num = output.getOutputNum()
        arithmeticOperation.inputNum(num)
        arithmeticOperation.operation = .minus
        
        // 결과값 출력
        let resultNum = arithmeticOperation.leftPort
        output.updateWithNum(resultNum)
        resultLabel.text = output.getOutputText()
        
        self.output = Output()
    }
    
    @IBAction func onTapNum0Button(_ sender: Any) {
        if resultLabel.text == "0" { return }
        output.textInput("0")
        resultLabel.text = output.getOutputText()
    }
    
    @IBAction func onTapNum1Button(_ sender: Any) {
        output.textInput("1")
        resultLabel.text = output.getOutputText()
    }
    
    @IBAction func onTapNum2Button(_ sender: Any) {
        output.textInput("2")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum3Button(_ sender: Any) {
        output.textInput("3")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum4Button(_ sender: Any) {
        output.textInput("4")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum5Button(_ sender: Any) {
        output.textInput("5")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum6Button(_ sender: Any) {
        output.textInput("6")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum7Button(_ sender: Any) {
        output.textInput("7")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum8Button(_ sender: Any) {
        output.textInput("8")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapNum9Button(_ sender: Any) {
        output.textInput("9")
        resultLabel.text = output.getOutputText()

    }
    
    @IBAction func onTapDotButton(_ sender: Any) {
        output.dot = true
        resultLabel.text = output.getOutputText()
    }
    
}

class Output {
    var integerPart: String = ""
    var decimalPart: String?
    var dot: Bool = false
    
    // class를 특정 숫자로 초기화
    func updateWithNum(_ num: Double) {
        if num > floor(num) {
            let integerNum = floor(num)
            let integerText = Int(integerNum).description
            let decimalNum = round( (num - integerNum) * 100) / 100 // 반올림 + 소수점 아래 2자리
            let decimalText = decimalNum.description
            
            self.integerPart = integerText
            dot = true
            let startIndex: String.Index = decimalText.index(decimalText.startIndex, offsetBy: 2)
            self.decimalPart = String(decimalText[startIndex...])
            
        } else {
            self.integerPart = Int(num).description
        }
    }
    
    // 숫자 -> Text
    func getOutputNum() -> Double {
        if dot == true {
            // 아무것도 입력안된 상태에 "." 누를경우 소수로 전환
            if self.integerPart == "" {
                self.integerPart = "0"
            }
            guard let decimalPart = self.decimalPart else { return Double(integerPart) ?? 0}
            let outputText = integerPart + "." + decimalPart
            return Double(outputText) ?? 0
            
        } else {
            return Double(integerPart) ?? 0
        }
    }

    // Text -> 숫자
    func getOutputText() -> String {
        if dot == true {
            // 아무것도 입력안된 상태에 "." 누를경우 소수로 전환
            if self.integerPart == "" {
                self.integerPart = "0"
            }
            
            let resultIntegerPart = integerPart.comma()
            var outputText = resultIntegerPart + "."
            guard let decimalPart = self.decimalPart else { return outputText }
            outputText += decimalPart
            return outputText
            
        } else {
            let resultIntegerPart = integerPart.comma()
            return resultIntegerPart
        }
    }
    
    // Text 입력
    func textInput(_ input: String) {
        if dot == true {
            guard var _ = self.decimalPart else {
                self.decimalPart = input
                return
            }
            self.decimalPart! += input
        } else {
            integerPart += input
        }
    }
}

struct ArithmeticOperation {
    var leftPort: Double = 0
    var rightPort: Double?
    var operation: Operation?

    // 좌항,우항 입력
    mutating func inputNum(_ num: Double) {
        if operation != nil {
            self.rightPort = num
            self.leftPort = self.operate()
            self.operation = nil
            self.rightPort = nil
        } else {
            self.leftPort = num
        }
    }

    // 연산기능 수행
    func operate() -> Double {
        switch operation {
        case .plus:
            return leftPort + rightPort!
        case .minus:
            return leftPort - rightPort!
        case .multiply:
            return leftPort * rightPort!
        case .divide:
            return leftPort / rightPort!
        case .progress:
            return leftPort
        default:
            return 0.0
        }
    }
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
    case progress
}

extension String {
    // <,> 기호 찍는 함수
    func comma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let resultInteger = numberFormatter.string(from: NSNumber(value: Int(self) ?? 0)) else {
            return ""
        }
        return resultInteger
    }
}
