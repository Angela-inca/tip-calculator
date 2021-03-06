//
//  ViewController.swift
//  tip calculator
//
//  Created by angela on 1/21/20.
//  Copyright © 2020 angela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var numPeopleSlider: UISlider!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
   
    @IBAction func calculateTip(_ sender: Any) {
        //GET the bill amount
        let bill = Double(billField.text!) ?? 0
        //Calculate the tip and total
        let roundedPercent = (round(tipPercentSlider.value * 100)) / 100.0
        tipPercentSlider.value = roundedPercent
        let step2: Float = 1
        let roundedPeople = round(numPeopleSlider.value / step2) * step2
        numPeopleSlider.value = roundedPeople
        let tip = bill * Double(tipPercentSlider.value)
        let total = bill + tip
        let perperson = total / Double(numPeopleSlider.value)
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        tipPercentageLabel.text! = String(format:"Tip %: %02d%%",Int(tipPercentSlider.value * 100) )
        totalLabel.text = String(format: "$%.2f", total)
        numPeopleLabel.text = String(format: "Split: %d", Int(numPeopleSlider.value))
        perPersonLabel.text = String(format: "$%.2f", perperson)
    }
    
}

