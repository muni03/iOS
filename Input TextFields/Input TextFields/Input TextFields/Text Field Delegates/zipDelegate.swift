//
//  zipDelegate.swift
//  Input TextFields
//
//  Created by pmuniz on 5/1/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import Foundation
import UIKit

class zipDelegate: NSObject, UITextFieldDelegate {
    
    //MARK Properties
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 5
    }
}
