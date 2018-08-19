//: Playground - noun: a place where people can play

import UIKit

var errorCodeString: String?
errorCodeString = "404"

var errorDescription: String?

if let theError = errorCodeString, let errorCodeInt = Int(theError),
    errorCodeInt == 404 {
    errorDescription = "\(errorCodeInt + 200): resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription
