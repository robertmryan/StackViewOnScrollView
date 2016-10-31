//
//  ChildViewController.swift
//  StackViewOnScrollView
//
//  Created by Robert Ryan on 10/31/16.
//  Copyright © 2016 Kévin MACHADO. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var string: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = string
    }

}
