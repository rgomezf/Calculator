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
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false

    //MARK: Actions
    @IBAction func digitTouched(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping == true {
            let currentDisplayedValue = display.text!
            display.text = currentDisplayedValue + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
        
    }

    @IBAction func performOperation(sender: UIButton) {
        userIsTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }
}

