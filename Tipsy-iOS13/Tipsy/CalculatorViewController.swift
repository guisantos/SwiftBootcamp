//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var amountSelected = 0.1
    var amountPerPerson = 0.0
    var pctSelected: String? = "10%"
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        pctSelected = sender.titleLabel?.text
        
        if sender.titleLabel?.text == "0%" {
            amountSelected = 0.0
        } else if sender.titleLabel?.text == "10%" {
            amountSelected = 0.1
        } else {
            amountSelected = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!) ?? 0.0
        let split = Double(splitNumberLabel.text!) ?? 0.0
        
        amountPerPerson = (bill + (bill * amountSelected)) / split
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculate" {
            let calc = segue.destination as! ResultsViewController
            calc.amountPerPerson = String(amountPerPerson)
            calc.settings = "Split between \(splitNumberLabel.text!) people, with \(pctSelected!)"
        }
    }
    
}

