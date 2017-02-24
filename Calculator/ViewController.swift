//
//  ViewController.swift
//  Calculator
//
//  Created by Ramon Gomez on 1/5/17.
//  Copyright © 2017 Ramon's. All rights reserved.
//

import UIKit

var calculatorCount = 0

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet fileprivate weak var display: UILabel!
    
    fileprivate var userIsTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCount += 1
        print("Loaded up a new Calculator (count = \(calculatorCount))")
    }
    
    deinit {
        calculatorCount -= 1
        print("Calculator left the heap (count = \(calculatorCount))")
    }

    fileprivate var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    fileprivate var brain = CalculatorBrain()
    
    //MARK: Actions
    @IBAction fileprivate func digitTouched(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping == true {
            let currentDisplayedValue = display.text!
            display.text = currentDisplayedValue + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
        
    }

    @IBAction fileprivate func performOperation(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

