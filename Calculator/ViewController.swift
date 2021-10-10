//
//  ViewController.swift
//  Calculator
//
//  Created by Kyungyun Lee on 2021/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    let numberPadStackView = UIStackView()
    let topFuntionStackView = UIStackView()
    let numberStackView1 = UIStackView()
    let numberStackView2 = UIStackView()
    let numberStackView3 = UIStackView()
    let bottomStackView = UIStackView()
    
    let clearButton = UIButton(type: .system)
    let reverseButton = UIButton(type: .system)
    let percentButton = UIButton(type: .system)
    let divisionButton = UIButton(type: .system)
    let multipleButton = UIButton(type: .system)
    let minusButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    let dotButton = UIButton(type: .system)
    let resultButton = UIButton(type: .system)
    
    let number7Button = UIButton(type: .system)
    let number8Button = UIButton(type: .system)
    let number9Button = UIButton(type: .system)
    let number4Button = UIButton(type: .system)
    let number5Button = UIButton(type: .system)
    let number6Button = UIButton(type: .system)
    let number1Button = UIButton(type: .system)
    let number2Button = UIButton(type: .system)
    let number3Button = UIButton(type: .system)
    let number0Button = UIButton(type: .system)
    
    let inputLabel = UILabel()
    let calcManager = CalcManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func pressedButton(sender : UIButton) {
        guard let text = sender.titleLabel?.text else {
            let alert = UIAlertController(title: "알림", message: "이상한 버튼을 눌렀어요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
            
        if CalcManager.isNumberText(text: text) {
            enterNumber(value: text)
            
        } else {
            if text == "AC" {
                calcManager.clear()
                inputLabel.text = calcManager.currentEnteredValue
            }
        }
    }
    
    private func enterNumber(value : String) {
        calcManager.enteredNumber(value: value)
        inputLabel.text = calcManager.currentEnteredValue
    }
    
    @objc private func pressedPlusButton() {
        calcManager.isCalculated = true
        calcManager.currentCalcType = .plus
        calcManager.calcAction()
    }
    
    @objc private func pressedminusButton() {
        calcManager.isCalculated = true
        calcManager.currentCalcType = .minus
        calcManager.calcAction()
    }
    
    @objc private func pressedDivisionButton() {
        calcManager.isCalculated = true
        calcManager.currentCalcType = .division
        calcManager.calcAction()
    }
    
    @objc private func pressedMultipleButton() {
        calcManager.isCalculated = true
        calcManager.currentCalcType = .multiple
        calcManager.calcAction()
    }
    
    @objc private func pressedReverseButton() {
        calcManager.reverse()
        inputLabel.text = calcManager.currentEnteredValue
        
    }
    
    @objc private func pressedPercentButton() {
        calcManager.isCalculated = true
        calcManager.currentCalcType = .percent
        calcManager.calcAction()
        
    }
    
    @objc private func pressedResultButton() {
        calcManager.result()
        inputLabel.text = calcManager.currentEnteredValue
    }
    

    
    
    private func setLayout() {
        
        view.addSubview(numberPadStackView)
        numberPadStackView.translatesAutoresizingMaskIntoConstraints = false
        numberPadStackView.addArrangedSubview(topFuntionStackView)
        numberPadStackView.addArrangedSubview(numberStackView1)
        numberPadStackView.addArrangedSubview(numberStackView2)
        numberPadStackView.addArrangedSubview(numberStackView3)
        numberPadStackView.addArrangedSubview(bottomStackView)
        numberPadStackView.axis = .vertical
        numberPadStackView.distribution = .fillEqually
        numberPadStackView.spacing = 1
        
        NSLayoutConstraint.activate([
        
            NSLayoutConstraint(item: numberPadStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300), NSLayoutConstraint(item: numberPadStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0), NSLayoutConstraint(item: numberPadStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0), NSLayoutConstraint(item: numberPadStackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        ])
        
        
        topFuntionStackView.addArrangedSubview(clearButton)
        topFuntionStackView.addArrangedSubview(reverseButton)
        topFuntionStackView.addArrangedSubview(percentButton)
        topFuntionStackView.addArrangedSubview(divisionButton)
        topFuntionStackView.axis = .horizontal
        topFuntionStackView.distribution = .fillEqually
        topFuntionStackView.spacing = 1
        
        
        func setButton(button : UIButton, isPointColor : Bool) {
            button.titleLabel?.font = Fonts.basicFont
            button.setTitleColor(Colors.basicButtonTextColor, for: .normal)
            button.addTarget(self, action: #selector(pressedButton(sender:)), for: .touchUpInside)
            
            if isPointColor {
                button.backgroundColor = Colors.basicButtonBackgroundColor
            } else {
                button.backgroundColor = Colors.basicPointColor
            }
        }
        
        clearButton.setTitle("AC", for: .normal)
        setButton(button: clearButton, isPointColor: true)
        
        reverseButton.setTitle("REV", for: .normal)
        reverseButton.addTarget(self, action: #selector(pressedReverseButton), for: .touchUpInside)
        setButton(button: reverseButton, isPointColor: true)
        
        percentButton.setTitle("%", for: .normal)
        percentButton.addTarget(self, action: #selector(pressedPercentButton), for: .touchUpInside)
        setButton(button: percentButton, isPointColor: true)
        
        divisionButton.setTitle("/", for: .normal)
        divisionButton.addTarget(self, action: #selector(pressedDivisionButton), for: .touchUpInside)
        setButton(button: divisionButton, isPointColor: false)
        
        func setHorizonStackView(_ stackView: UIStackView, _ isBottomStackView: Bool = false) {
            stackView.spacing = 1
            stackView.axis = .horizontal
            
            if isBottomStackView {
                stackView.distribution = .fill
                
            } else {
                stackView.distribution = .fillEqually
            }
        }
    
        numberStackView1.addArrangedSubview(number7Button)
        numberStackView1.addArrangedSubview(number8Button)
        numberStackView1.addArrangedSubview(number9Button)
        numberStackView1.addArrangedSubview(multipleButton)
        
        setHorizonStackView(numberStackView1)
        
        number7Button.setTitle("7", for: .normal)
        setButton(button: number7Button, isPointColor: true)
        
        number8Button.setTitle("8", for: .normal)
        setButton(button: number8Button, isPointColor: true)
        
        number9Button.setTitle("9", for: .normal)
        setButton(button: number9Button, isPointColor: true)
        
        multipleButton.setTitle("*", for: .normal)
        multipleButton.addTarget(self, action: #selector(pressedMultipleButton), for: .touchUpInside)
        setButton(button: multipleButton, isPointColor: false)
        
        numberStackView2.addArrangedSubview(number4Button)
        numberStackView2.addArrangedSubview(number5Button)
        numberStackView2.addArrangedSubview(number6Button)
        numberStackView2.addArrangedSubview(minusButton)
        
        setHorizonStackView(numberStackView2)
        
        number4Button.setTitle("4", for: .normal)
        setButton(button: number4Button, isPointColor: true)
        
        number5Button.setTitle("5", for: .normal)
        setButton(button: number5Button, isPointColor: true)
        
        number6Button.setTitle("6", for: .normal)
        setButton(button: number6Button, isPointColor: true)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.addTarget(self, action: #selector(pressedminusButton), for: .touchUpInside)
        setButton(button: minusButton, isPointColor: false)
        
        numberStackView3.addArrangedSubview(number1Button)
        numberStackView3.addArrangedSubview(number2Button)
        numberStackView3.addArrangedSubview(number3Button)
        numberStackView3.addArrangedSubview(plusButton)
        
        setHorizonStackView(numberStackView3)
        
        number1Button.setTitle("1", for: .normal)
        setButton(button: number1Button, isPointColor: true)
        
        number2Button.setTitle("2", for: .normal)
        setButton(button: number2Button, isPointColor: true)
        
        number3Button.setTitle("3", for: .normal)
        setButton(button: number3Button, isPointColor: true)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.addTarget(self, action: #selector(pressedPlusButton), for: .touchUpInside)
        setButton(button: plusButton, isPointColor: false)
        
        bottomStackView.addArrangedSubview(number0Button)
        bottomStackView.addArrangedSubview(dotButton)
        bottomStackView.addArrangedSubview(resultButton)
        
        setHorizonStackView(bottomStackView, true)
        
        number0Button.setTitle("0", for: .normal)
        setButton(button: number0Button, isPointColor: true)
        
        dotButton.setTitle(".", for: .normal)
        setButton(button: dotButton, isPointColor: false)
        
        let size = UIScreen.main.bounds.width/4-0.75
        dotButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            NSLayoutConstraint(item: dotButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size)
        
        ])
        
        
        resultButton.setTitle("=", for: .normal)
        setButton(button: resultButton, isPointColor: false)
        resultButton.addTarget(self, action: #selector(pressedResultButton), for: .touchUpInside)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            NSLayoutConstraint(item: resultButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size)
        
        ])
        
        view.addSubview(inputLabel)
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.textColor = UIColor.black
        inputLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        inputLabel.textAlignment = .right
        inputLabel.text = "0"
        inputLabel.minimumScaleFactor = 0.25
        inputLabel.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
        
            NSLayoutConstraint(item: inputLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 30), NSLayoutConstraint(item: inputLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -30), NSLayoutConstraint(item: inputLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0), NSLayoutConstraint(item: inputLabel, attribute: .bottom, relatedBy: .equal, toItem: numberPadStackView, attribute: .top, multiplier: 1, constant: 0)
        ])
    }


}

