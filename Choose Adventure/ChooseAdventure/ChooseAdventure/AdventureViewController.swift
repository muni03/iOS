//
//  AdventureViewController.swift
//  ChooseAdventure
//
//  Created by pmuniz on 5/8/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class AdventureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }

    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }


}

