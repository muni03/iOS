//
//  ViewController.swift
//  Name Game
//
//  Created by pmuniz on 3/6/18.
//  Copyright © 2018 pmuniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != ""{
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
        else{
            lyricsView.text = "Please enter a name."
        }
    }
    
    func shortNameFrom(name: String) -> String{
        let lowercaseName = name.lowercased()
        let vowels = CharacterSet.init(charactersIn: "aeiou")
        
        if let index = lowercaseName.rangeOfCharacter(from: vowels)?.lowerBound {
            return String(lowercaseName[index...])
        }
        
        return ""
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String{
        let short = String(shortNameFrom(name: fullName))
        
        return lyricsTemplate.replacingOccurrences(of: "<SHORT_NAME>", with: short).replacingOccurrences(of: "<FULL_NAME>", with: fullName)}
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>!"].joined(separator: "\n")
    
    
    //print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Talia"))
    
}

