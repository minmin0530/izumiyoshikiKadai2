//
//  ViewController.swift
//  izumiyoshikiKadai2
//
//  Created by 泉芳樹 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    var operatorKind: Calc.OperatorKinds = .neutral
    var calc: Calc = Calc()
    @IBOutlet weak private var calcButtonsStackView: UIStackView!
    @IBOutlet weak private var inputNumberTextField1: UITextField!
    @IBOutlet weak private var inputNumberTextField2: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var calcAddButton: UIButton!
    @IBOutlet weak private var calcSubButton: UIButton!
    @IBOutlet weak private var calcSumButton: UIButton!
    @IBOutlet weak private var calcDivButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBorder()
    }
    func settingBorder() {
        inputNumberTextField1.layer.cornerRadius = 6
        inputNumberTextField2.layer.cornerRadius = 6
        calcButtonsStackView.layer.cornerRadius = 10
        inputNumberTextField1.layer.borderWidth = 1
        inputNumberTextField2.layer.borderWidth = 1
        calcButtonsStackView.layer.borderWidth = 1
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
        calcButtonsStackView.layer.borderColor = CGColor.init(
            red: 50.0 / 255.0,
            green: 115.0 / 255.0,
            blue: 220.0 / 255.0,
            alpha: 1.0)
    }
    func clear4ButtonsColor() {
        calcAddButton.backgroundColor = .white
        calcSubButton.backgroundColor = .white
        calcSumButton.backgroundColor = .white
        calcDivButton.backgroundColor = .white
        calcAddButton.tintColor = .systemBlue
        calcSubButton.tintColor = .systemBlue
        calcSumButton.tintColor = .systemBlue
        calcDivButton.tintColor = .systemBlue
    }
    @IBAction private func calcAddButtonTapped(_ sender: Any) {
        operatorKind = .add
        clear4ButtonsColor()
        calcAddButton.backgroundColor = .systemBlue
        calcAddButton.tintColor = .white
    }
    @IBAction private func calcSubButtonTapped(_ sender: Any) {
        operatorKind = .sub
        clear4ButtonsColor()
        calcSubButton.backgroundColor = .systemBlue
        calcSubButton.tintColor = .white
    }
    @IBAction private func calcSumButtonTapped(_ sender: Any) {
        operatorKind = .sum
        clear4ButtonsColor()
        calcSumButton.backgroundColor = .systemBlue
        calcSumButton.tintColor = .white
    }
    @IBAction private func calcDivButtonTapped(_ sender: Any) {
        operatorKind = .div
        clear4ButtonsColor()
        calcDivButton.backgroundColor = .systemBlue
        calcDivButton.tintColor = .white
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
        resultLabel.text = calc.calc(num1: number1, num2: number2, operatorKind: operatorKind)
    }
}
