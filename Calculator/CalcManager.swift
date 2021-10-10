//
//  CalcManager.swift
//  Calculator
//
//  Created by Kyungyun Lee on 2021/09/26.
//

import Foundation

class CalcManager {
    
    var currentEnteredValue : String = ""
    var isCalculated : Bool = false
    var isIntNumber : Bool = false
    var currentCalcType : CalcType?
    var inputValueQueue : [Double] = []
    
    enum CalcType {
        case plus, minus, division, multiple, percent
    }
    
    func enteredNumber(value : String) {
        
        if isCalculated {
            isCalculated = false
            currentEnteredValue = value
        }   else {
            if currentEnteredValue == "0" {
                currentEnteredValue = value
            } else {
            currentEnteredValue += value
            }
        }
    }
    
    func calcAction() {
        inputValueQueue.append(Double(currentEnteredValue)!)
        print(inputValueQueue)
    }
    
    func clear() {
        inputValueQueue.removeAll()
        currentEnteredValue = "0"
        isCalculated = false
    }
    
    func plus() {
        var result : Double = 0
        
        for value in inputValueQueue {
            result += value
        }
        currentEnteredValue = String(result)
    }
    
    func minus() {
        var result : Double = 0
        var isfirst = true
        
        for value in inputValueQueue {
            if isfirst {
                isfirst = false
                result = value
            } else {
                result -= value
            }
        }
        currentEnteredValue = String(result)
    }
    
    func division() {
        var result : Double = 0
        var isfirst = true
        
        for value in inputValueQueue {
            if isfirst {
                isfirst = false
                result = value
            } else {
                result /= value
            }
        }
        currentEnteredValue = String(result)
    }
    
    func multiple() {
        var result : Double = 0
        var isfirst = true
        
        for value in inputValueQueue {
            if isfirst {
                isfirst = false
                result = value
            } else {
                result *= value
            }
        }
        currentEnteredValue = String(result)
    }
    
    
    func percent() {
        var result : Double = 0
        
        let firstValue = inputValueQueue.first ?? 0
        print(firstValue)
        let lastValue = inputValueQueue.last ?? 0
        
        result = firstValue.truncatingRemainder(dividingBy: lastValue)
        
        currentEnteredValue = String(result)
        }

    func reverse() {
        let nowValue = Double(currentEnteredValue) ?? 0
        var afterValue : Double = 0
        
        if nowValue == 0 {
            afterValue = 0
            
        } else {
            afterValue = nowValue * -1.0
        }
        currentEnteredValue = String(afterValue)
    }
    
    func dotPoint() {
        if currentEnteredValue.count == 0 {
            currentEnteredValue = "0."
        } else {
            if !isCalculated {
                if !currentEnteredValue.contains(".") {
                    currentEnteredValue += "."
                }
            }
        }
    }
    
    func result(){
        isCalculated = true
        
        guard let currentCalcType = currentCalcType else {
            return
        }
        
        calcAction()
        
        switch currentCalcType {
        case .plus:
            plus()
            break
        case .minus:
            minus()
            break
        case .division:
            division()
            break
        case .multiple:
            multiple()
            break
        case .percent:
            percent()
            break
        }
        
        inputValueQueue.removeAll()
        self.currentCalcType = nil
    }
    
    func isBlockCheck() -> Bool{
        guard let value = currentEnteredValue.last else {
            return false
        }
        
        if value == "." {
            return true
        } else {
            return false
        }
    }
    
    static func isNumberText(text : String) -> Bool {
        if let number = Int(text) { // "1" >> 1
            return true
        } else {
            return false
        }
    }
    
}

