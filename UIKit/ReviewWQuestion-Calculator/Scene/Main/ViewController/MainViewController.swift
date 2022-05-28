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
    @IBOutlet var commaButton: UIButton!
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
    var arithmeticOperation = ArithmeticOperation(leftPort: 0, rightPort: nil, operation: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setResultLabel()
        setButtonCornerRadius()
        
        func setResultLabel() {
            updateLabel(with: arithmeticOperation.leftPort)
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
            commaButton.cornerRadius = commaButton.layer.frame.width * 0.5
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
    }
    
    @IBAction func onTapNum1Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum2Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum3Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum4Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum5Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum6Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum7Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum8Button(_ sender: Any) {
    }
    
    @IBAction func onTapNum9Button(_ sender: Any) {
    }
    
    
    
    func updateLabel(with result: Double) {
        if result > floor(result) {
            resultLabel.text = result.description
        } else {
            resultLabel.text = Int(result).description
        }
    }
}

struct ArithmeticOperation {
    var leftPort: Double
    var rightPort: Double?
    var operation: Operation?
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
}
