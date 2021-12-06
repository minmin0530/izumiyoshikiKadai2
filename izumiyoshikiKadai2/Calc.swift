//
//  Calc.swift
//  izumiyoshikiKadai2
//
//  Created by 泉芳樹 on 2021/11/27.
//

import Foundation

class Calc {
    enum OperatorKinds {
        case add
        case sub
        case sum
        case div
        case neutral
    }
    static let inputTextFieldMessage: String = "数字を入力してください"
    private let neutralMessage: String = "+-×÷を選んでください"
    private let zeroMessage: String = "0以外を入力してください"
    private let digitsMessage: String = "桁数が大き過ぎます"
    private var result: String?
    func calc(num1: Double, num2: Double, operatorKind: OperatorKinds) -> String {
        switch operatorKind {
        case .add:
            result = Int64(num1 + num2).description
        case .sub:
            result = Int64(num1 - num2).description
        case .sum:
            if 19 < num1.description.count + num2.description.count {
                result = digitsMessage
            } else {
                result = Int64(num1 * num2).description
            }
        case .div:
            if num2 == 0 {
                result = zeroMessage
            } else {
                result = Double(num1 / num2).description
            }
        case .neutral:
            result = neutralMessage
        }
        return result!
    }
}
