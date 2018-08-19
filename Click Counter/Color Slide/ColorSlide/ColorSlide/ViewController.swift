//
//  ViewController.swift
//  ColorSlide
//
//  Created by pmuniz on 4/30/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func redSliderChange(_ sender: UISlider) {
        getColor()
    }
    
    @IBAction func greenSliderChange(_ sender: UISlider) {
        getColor()
    }
    
    @IBAction func blueSliderChange(_ sender: UISlider) {
        getColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getColor()
        
    }
    
    func getColor(){
        let color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        colorView.backgroundColor = color
    }

}
