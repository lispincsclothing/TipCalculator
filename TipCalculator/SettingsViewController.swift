//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Develop on 8/11/20.
//  Copyright © 2020 Develop. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var defaulttipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let defaulttipIndex = defaults.integer(forKey: "defaulttipIndexInt")

         defaulttipControl.selectedSegmentIndex = defaulttipIndex
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateDefaultTip(_ sender: Any) {
        print("UpdateDefaultTip")
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        let defaulttipIndex = defaulttipControl.selectedSegmentIndex
        
        defaults.set(defaulttipIndex, forKey: "defaulttipIndexInt")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    @IBAction func updateDefaultTip2(_ sender: Any) {
        print("UpdateDefaultTip2")
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        let defaulttipIndex = defaulttipControl.selectedSegmentIndex
        
        defaults.set(defaulttipIndex, forKey: "defaulttipIndexInt")

        // Force UserDefaults to save.
        defaults.synchronize()
    }
}
