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
    
    private var arithmeticOperation = ArithmeticOperation()
    private var output = Output()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setButtonCornerRadius()
        
        func setButtonCornerRadius() {
            DispatchQueue.main.async {
                self.ACButton.cornerRadius = self.ACButton.layer.frame.width * 0.5
                self.plusMinusButton.cornerRadius = self.plusMinusButton.layer.frame.width * 0.5
                self.percentButton.cornerRadius = self.percentButton.layer.frame.width * 0.5
                self.divideButton.cornerRadius = self.divideButton.layer.frame.width * 0.5
                self.multiplyButton.cornerRadius = self.multiplyButton.layer.frame.width * 0.5
                self.minusButton.cornerRadius = self.minusButton.layer.frame.width * 0.5
                self.plusButton.cornerRadius = self.plusButton.layer.frame.width * 0.5
                self.equalButton.cornerRadius = self.equalButton.layer.frame.width * 0.5
                self.dotButton.cornerRadius = self.dotButton.layer.frame.width * 0.5
                self.num0Button.cornerRadius = self.num0Button.layer.frame.width * 0.25
                self.num1Button.cornerRadius = self.num1Button.layer.frame.width * 0.5
                self.num2Button.cornerRadius = self.num2Button.layer.frame.width * 0.5
                self.num3Button.cornerRadius = self.num3Button.layer.frame.width * 0.5
                self.num4Button.cornerRadius = self.num4Button.layer.frame.width * 0.5
                self.num5Button.cornerRadius = self.num5Button.layer.frame.width * 0.5
                self.num6Button.cornerRadius = self.num6Button.layer.frame.width * 0.5
                self.num7Button.cornerRadius = self.num7Button.layer.frame.width * 0.5
                self.num8Button.cornerRadius = self.num8Button.layer.frame.width * 0.5
                self.num9Button.cornerRadius = self.num9Button.layer.frame.width * 0.5
            }
        }
    }
    
    @IBAction func onTapClearButton(_ sender: Any) {
        self.arithmeticOperation = ArithmeticOperation()
        self.output = Output()
        resultLabel.text = "0"
    }
    
    @IBAction func onTapEqualButton(_ sender: Any) {
        // 등호 누르면 가장 최근에한 연산 반복
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operateWithOldOperation()
            updateLabel()
            return
        }
        
        let num = self.output.getOutputAsNumber()
        self.arithmeticOperation.inputAndOperateNum(num)
        updateLabel()

        self.arithmeticOperation.inputOperation(.progress)
    }
    
    @IBAction func onTapPlusButton(_ sender: Any) {
        guard self.arithmeticOperation.operation != .plus else { return }
        
        let num = self.output.getOutputAsNumber()
        self.arithmeticOperation.inputAndOperateNum(num)
        self.arithmeticOperation.inputOperation(.plus)

        updateLabel()
    }
    
    @IBAction func onTapMinusButton(_ sender: Any) {
        guard self.arithmeticOperation.operation != .minus else { return }

        let num = self.output.getOutputAsNumber()
        self.arithmeticOperation.inputAndOperateNum(num)
        self.arithmeticOperation.inputOperation(.minus)

        updateLabel()
    }
    
    @IBAction func onTapMultiplyButton(_ sender: Any) {
        guard self.arithmeticOperation.operation != .multiply else { return }

        let num = self.output.getOutputAsNumber()
        self.arithmeticOperation.inputAndOperateNum(num)
        self.arithmeticOperation.inputOperation(.multiply)

        updateLabel()
    }
    
    @IBAction func onTapDivideButton(_ sender: Any) {
        guard self.arithmeticOperation.operation != .divide else { return }

        let num = self.output.getOutputAsNumber()
        self.arithmeticOperation.inputAndOperateNum(num)
        self.arithmeticOperation.inputOperation(.divide)

        updateLabel()
    }
    
    @IBAction func onTapNum0Button(_ sender: Any) {
        if resultLabel.text == "0" { return }
        
        switch self.arithmeticOperation.operation {
        case .divide:
            resultLabel.text = "오류"
            self.arithmeticOperation = ArithmeticOperation()
            self.output = Output()
            return
            
        case .progress:
            self.arithmeticOperation.operation = nil
            self.output = Output()
            fallthrough
            
        default:
            self.output.textInput("0")
            resultLabel.text = self.output.getOutputAsText()
        }
    }
    
    @IBAction func onTapNum1Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("1")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum2Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("2")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum3Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("3")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum4Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("4")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum5Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("5")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum6Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("6")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum7Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("7")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum8Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("8")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapNum9Button(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            self.arithmeticOperation.operation = nil
            self.output = Output()
        }
        self.output.textInput("9")
        resultLabel.text = self.output.getOutputAsText()
    }
    
    @IBAction func onTapDotButton(_ sender: Any) {
        if self.arithmeticOperation.operation == .progress {
            return
        }
        self.output.dot = true
        resultLabel.text = self.output.getOutputAsText()
    }
    
// MARK: 결과값 출력
    func updateLabel() {
        let resultNum = self.arithmeticOperation.leftPort
        self.output.updateOutputWithNumber(resultNum)
        resultLabel.text = self.output.getOutputAsText()

        self.output = Output()
    }
}
