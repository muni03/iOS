//
//  ViewController.swift
//  Input TextFields
//
//  Created by pmuniz on 5/1/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Outlets
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var editSwitch: UISwitch!
    
    //MARK: Text Field Delegate Objects
    let zipDel = zipDelegate()
    let cashDel = cashDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set delegates
        self.zipTextField.delegate = zipDel
        self.cashTextField.delegate = cashDel
        self.lockableTextField.delegate = self
        
        
    }
    @IBAction func editSwitchAction(_ sender: Any) {
        if editSwitch.isOn{
            lockableTextField.isUserInteractionEnabled = true
        }else {
            lockableTextField.isUserInteractionEnabled = false
        }
    }
    
    
    //MARK: lockableTextField Delegate Methods
    
    

}

