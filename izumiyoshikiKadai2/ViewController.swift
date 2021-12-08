//
//  ViewController.swift
//  izumiyoshikiKadai2
//
//  Created by 泉芳樹 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    var calc: Calc = Calc()
    @IBOutlet weak private var inputNumberTextField1: UITextField!
    @IBOutlet weak private var inputNumberTextField2: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!

    @IBOutlet weak private var operatorSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        settingBorder()
    }
    func settingBorder() {
        inputNumberTextField1.layer.cornerRadius = 6
        inputNumberTextField2.layer.cornerRadius = 6
        inputNumberTextField1.layer.borderWidth = 1
        inputNumberTextField2.layer.borderWidth = 1
        inputNumberTextField2.layer.borderColor = CGColor.init(
            red: 0.5,
            green: 0.5,
            blue: 0.5,
            alpha: 0.5)
        inputNumberTextField1.layer.borderColor = CGColor.init(
            red: 0.5,
            green: 0.5,
            blue: 0.5,
            alpha: 0.5)
    }

    @IBAction private func calcResultButtonTapped(_ sender: Any) {
        guard let text1 = inputNumberTextField1.text, let number1 = Double(text1) else {
            resultLabel.text = Calc.inputTextFieldMessage
            return
        }
        guard let text2 = inputNumberTextField2.text, let number2 = Double(text2) else {
            resultLabel.text = Calc.inputTextFieldMessage
            return
        }
        guard let ope = Calc.OperatorKinds(selectedIndex: operatorSegmentedControl.selectedSegmentIndex) else { return }
        resultLabel.text = calc.calc(num1: number1, num2: number2, operatorKind: ope)
    }
}

private extension Calc.OperatorKinds {
    init?(selectedIndex: Int) {
        switch selectedIndex {
        case 0:
            self = .add
        case 1:
            self = .sub
        case 2:
            self = .sum
        case 3:
            self = .div
        default:
            return nil
        }
    }
}
