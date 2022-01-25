//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Ermain Paul on 1/24/22.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var billAmountTextField: UITextField!
	@IBOutlet weak var tipAmountLabel: UILabel!
	@IBOutlet weak var tipControl: UISegmentedControl!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var splitTextField: UITextField!
	
	var total: Double = 0
	// Get total tip by multiplying tip * tipPercentage
	let tipPercentages = [0.15, 0.18, 0.20]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func calculateTip(_ sender: Any) {
		// Get bill amount from text field input
		let bill = Double(billAmountTextField.text!) ?? 0
		
		let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
		total = bill + tip
		
		// Update the tip amount label
		tipAmountLabel.text = String(format: "$%.2f", tip)
		// Update the total amount
		totalLabel.text = String(format: "$%.2f", total)
	}
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		print(sender.value)
		splitTextField.text = String(Int(sender.value))
		totalLabel.text = String(format: "$%.2f", total / sender.value)
	}
}

