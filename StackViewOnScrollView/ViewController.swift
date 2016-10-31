//
//  ViewController.swift
//  StackViewOnScrollView
//
//  Created by Kévin MACHADO on 27/10/2016.
//  Copyright © 2016 Kévin MACHADO. All rights reserved.
//

import UIKit

/// This class is Used for
class EmptySegue: UIStoryboardSegue {
    
    override func perform() {
        // nothing...
    }
    
}


class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

