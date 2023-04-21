//
//  ViewController.swift
//  tip_calculator
//
//  Created by 5e on 3/7/23.
//



import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var subTotalTextField: UITextField!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
        
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tip15Button: UIButton!
    @IBOutlet weak var tip18Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    @IBOutlet weak var customTipButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var customTipText: UITextField!
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    
    var tipPercentage: Double = 0.0
    var totalAmount = 0.0
    var amountPerPerson = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func tip15ButtonPressed(_ sender: UIButton) {
        tipPercentage = 0.15
        updateTipAmount()
    }
        
    @IBAction func tip18ButtonPressed(_ sender: UIButton) {
        tipPercentage = 0.18
        updateTipAmount()
    }
        
    @IBAction func tip20ButtonPressed(_ sender: UIButton) {
        tipPercentage = 0.2
        updateTipAmount()
    }
        
    @IBAction func customTipButtonPressed(_ sender: UIButton) {
        if let customTipText = customTipText.text, let customTip = Double(customTipText) {
            tipPercentage = customTip / 100
            updateTipAmount()
        }
    }
        
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        subTotalTextField.text = ""
        tipAmountTextField.text = ""
        totalAmountTextField.text = ""
        amountPerPersonLabel.text = ""
    }
        
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        updateTipAmount()
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        updateAmountPerPerson()
    }
        
    func updateTipAmount() {
        if let subTotalText = subTotalTextField.text, let subTotal = Double(subTotalText) {
            let tipAmount = subTotal * tipPercentage
            totalAmount = subTotal + tipAmount
            tipAmountTextField.text = String(format: "%.2f", tipAmount)
            totalAmountTextField.text = String(format: "%.2f", totalAmount)
            updateAmountPerPerson()
        }
    }
    
    func updateAmountPerPerson() {
        if stepper.value > 0 {
            amountPerPerson = totalAmount / stepper.value
            amountPerPersonLabel.text = String(format: "$%.2f per person", amountPerPerson)
        } else {
            amountPerPersonLabel.text = ""
        }
    }
}
