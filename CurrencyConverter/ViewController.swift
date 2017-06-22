//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Wismin Effendi on 5/29/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    
    // conversion rate 
    let poundRate = 0.69
    let yenRate = 113.94
    let euroRate = 0.89
    var dollarAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
    }
    


    @IBAction func convertCurrency(_ sender: UIButton) {
        convertFromDollar()
    }

    @IBAction func clearInputText(_ sender: UIButton) {
        inputTextField.text = ""
        convertFromDollar()
    }
    
    // Helper 
    private func convertFromDollar() {
        if let amount = Double(inputTextField.text!) {
            dollarAmount = amount
        }
        
        poundLabel.text = "\(dollarAmount * poundRate)"
        yenLabel.text = "\(dollarAmount * yenRate)"
        euroLabel.text = "\(dollarAmount * euroRate)"
        dollarAmount = 0.0
    }


    // Called when 'return' key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        convertFromDollar()
        textField.resignFirstResponder()
        return true
    }
    
    
    // Called when user taps outside the text field 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        convertFromDollar()
        view.endEditing(true)
    }
    
    
}

