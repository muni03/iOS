//
//  ViewController.swift
//  clickCounter
//
//  Created by pmuniz on 5/20/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var label: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        //label 1
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 150, width: 60, height: 60)
        label.text = "0"
        label.textColor = UIColor.cyan
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        view.addSubview(label)
        self.label = label
        
        //label 2
        let label2 = UILabel()
        label2.frame = CGRect(x: 280, y: 150, width: 60, height: 60)
        label2.text = "0"
        label2.textColor = UIColor.cyan
        label2.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        view.addSubview(label2)
        self.label2 = label2
        
        //increment
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 250, width: 100, height: 100)
        button.setTitle("Increment", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        button.setTitleColor(UIColor.cyan, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        
        //decrement
        let button2 = UIButton()
        button2.frame = CGRect(x: 200, y: 250, width: 200, height: 100)
        button2.setTitle("Decrement", for: .normal)
        button2.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        button2.setTitleColor(UIColor.cyan, for: .normal)
        view.addSubview(button2)
        
        button2.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        
        
    }
    
    @objc func incrementCount() {
        count += 1
        label.text = "\(count)"
        label2.text = "\(count)"
        if view.backgroundColor == UIColor.lightGray {
            view.backgroundColor = UIColor.black
        } else {
            view.backgroundColor = UIColor.lightGray
        }
    }
    
    @objc func decrementCount() {
        count -= 1
        label.text = "\(count)"
        label2.text = "\(count)"
        if view.backgroundColor == UIColor.lightGray {
            view.backgroundColor = UIColor.black
        } else {
            view.backgroundColor = UIColor.lightGray
        }
    }
    
    


}

