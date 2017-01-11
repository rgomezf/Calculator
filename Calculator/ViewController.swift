//
//  ViewController.swift
//  Calculator
//
//  Created by Ramon Gomez on 1/5/17.
//  Copyright © 2017 Ramon's. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet private weak var display: UILabel!
    private var userIsTyping = false

    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    
    //MARK: Actions
    @IBAction private func digitTouched(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping == true {
            let currentDisplayedValue = display.text!
            display.text = currentDisplayedValue + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
        
    }

    @IBAction private func performOperation(sender: UIButton) {
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

