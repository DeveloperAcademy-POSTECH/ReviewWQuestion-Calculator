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
    var outputNumber = OutputNumber()
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
        self.outputNumber = OutputNumber()
        resultLabel.text = "0"
    }
    
    @IBAction func onTapNum0Button(_ sender: Any) {
        outputNumber.textInput("0")
        resultLabel.text = outputNumber.getOutputText()
    }
    
    @IBAction func onTapNum1Button(_ sender: Any) {
        outputNumber.textInput("1")
        resultLabel.text = outputNumber.getOutputText()
    }
    
    @IBAction func onTapNum2Button(_ sender: Any) {
        outputNumber.textInput("2")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum3Button(_ sender: Any) {
        outputNumber.textInput("3")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum4Button(_ sender: Any) {
        outputNumber.textInput("4")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum5Button(_ sender: Any) {
        outputNumber.textInput("5")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum6Button(_ sender: Any) {
        outputNumber.textInput("6")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum7Button(_ sender: Any) {
        outputNumber.textInput("7")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum8Button(_ sender: Any) {
        outputNumber.textInput("8")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapNum9Button(_ sender: Any) {
        outputNumber.textInput("9")
        resultLabel.text = outputNumber.getOutputText()

    }
    
    @IBAction func onTapDotButton(_ sender: Any) {
        outputNumber.dot = true
        resultLabel.text = outputNumber.getOutputText()
    }
    
}

struct OutputNumber {
    var integerPart: String = ""
    var decimalPart: String?
    var dot: Bool = false
    
    mutating func getOutputText() -> String {
        if dot == true {
            if self.integerPart == "" {
                self.integerPart = "0"
            }
            var outputText = integerPart + "."
            guard let decimalPart = self.decimalPart else { return outputText }
            outputText += decimalPart
            return outputText
        } else {
            return integerPart
        }
    }
    
    mutating func textInput(_ input: String) {
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

class ArithmeticOperation {
    var leftPort: Double = 0.0
    var rightPort: Double?
    var operation: Operation?
    
    func newInput(with input: Int) {
        switch operation {
        case .dot: break
        case .plus: break
        case .minus: break
        case .multiply: break
        case .divide: break
        default: break
        }
    }
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
    case dot
}
