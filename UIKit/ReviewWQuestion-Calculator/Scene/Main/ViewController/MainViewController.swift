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
    var AO = ArithmeticOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setResultLabel()
        setButtonCornerRadius()
        
        func setResultLabel() {
            updateLabel()
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
    
    @IBAction func onTapNum0Button(_ sender: Any) {
        AO.newInput(with: 0)
        updateLabel()
    }
    
    @IBAction func onTapNum1Button(_ sender: Any) {
        AO.newInput(with: 1)
        updateLabel()
    }
    
    @IBAction func onTapNum2Button(_ sender: Any) {
        AO.newInput(with: 2)
        updateLabel()
    }
    
    @IBAction func onTapNum3Button(_ sender: Any) {
        AO.newInput(with: 3)
        updateLabel()
    }
    
    @IBAction func onTapNum4Button(_ sender: Any) {
        AO.newInput(with: 4)
        updateLabel()
    }
    
    @IBAction func onTapNum5Button(_ sender: Any) {
        AO.newInput(with: 5)
        updateLabel()
    }
    
    @IBAction func onTapNum6Button(_ sender: Any) {
        AO.newInput(with: 6)
        updateLabel()
    }
    
    @IBAction func onTapNum7Button(_ sender: Any) {
        AO.newInput(with: 7)
        updateLabel()
    }
    
    @IBAction func onTapNum8Button(_ sender: Any) {
        AO.newInput(with: 8)
        updateLabel()
    }
    
    @IBAction func onTapNum9Button(_ sender: Any) {
        AO.newInput(with: 9)
        updateLabel()
    }
    
    @IBAction func onTapDotButton(_ sender: Any) {
        AO.operation = .dot
        AO.resultString += "."

        updateLabel()
    }
    
    
    func updateLabel() {
        let result = AO.resultString
        resultLabel.text = result
    }
}

class ArithmeticOperation {
    var leftPort: Double = 0.0
    var rightPort: Double?
    var operation: Operation?
    var resultString: String = "0"
    
    func newInput(with input: Int) {
        switch operation {
        case .dot:
            self.operation = nil
            break
        case .plus: break
        case .minus: break
        case .multiply: break
        case .divide: break
        default:
            if leftPort == 0 {
                leftPort = Double(input)
                resultString = String(input)
                return
            }
            resultString = resultString + String(input)
            guard let newVal = Double(resultString) else { return }
            self.leftPort = newVal
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
