//
//  ViewController.swift
//  TipCalculator
//
//  Created by Develop on 8/11/20.
//  Copyright © 2020 Develop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let defaulttipIndex = defaults.integer(forKey: "defaulttipIndexInt")
         
         tipControl.selectedSegmentIndex = defaulttipIndex
        
        recalculate_tipandtotal()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        print("hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        recalculate_tipandtotal()
    }
    
    func recalculate_tipandtotal(){
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        //NOTE: exclamation mark is to denote optionals
        //NOTE: ?? to default to 0 if cannot be converted to Double
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        //NOTE: Removed "$\(tip)"
    }
}

