//
//  TopBottomTextFieldDelegate.swift
//  MemeGen
//
//  Created by pmuniz on 5/2/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import Foundation
import UIKit

class TopBottomTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
