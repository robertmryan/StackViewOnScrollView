//
//  ScrollView.swift
//  StackViewOnScrollView
//
//  Created by Kévin MACHADO on 31/10/2016.
//  Copyright © 2016 Kévin MACHADO. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var strings = ["echo", "hola", "allo", "foo", "bar", "baz", "qux", "Mo", "Larry", "Curly", "Shemp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainers()
    }
    
    private func removeContainers() {
        for child in childViewControllers {
            child.willMove(toParentViewController: nil)
            stackView.removeArrangedSubview(child.view)
            child.removeFromParentViewController()
        }
    }
    
    private func setupContainers() {
        removeContainers()
        for string in strings {
            let child = storyboard!.instantiateViewController(withIdentifier: "Child") as! ChildViewController
            addChildViewController(child)
            child.string = string
            stackView.addArrangedSubview(child.view)
            child.didMove(toParentViewController: self)
        }
    }
}
