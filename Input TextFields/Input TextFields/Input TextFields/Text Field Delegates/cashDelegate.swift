//
//  cashDelegate.swift
//  Input TextFields
//
//  Created by pmuniz on 5/1/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import Foundation
import UIKit

class cashDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let myInteger = Int(textField.text!) {
            let myNumber = NSNumber(value:myInteger)
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.minimumSignificantDigits = 4
        numberFormatter.NSNumber(from: myNumber)
        return true
    }

}
