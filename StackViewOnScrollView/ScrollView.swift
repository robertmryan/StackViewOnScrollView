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
    
    private var strings = ["echo", "hola", "allo"]
    
    private var containerViews = [ContainerView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        self.setupContainers()
    }
    
    fileprivate func removeContainers() {
        for container in containerViews {
            container.uninstall()
        }
        containerViews.removeAll()
    }
    
    fileprivate func setupContainers() {
        removeContainers()
        for string in strings {
            performSegue(withIdentifier: "TestSegue", sender: string)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        let index = strings.index(of: sender as! String)!
        add(viewController, at: index)
    }
    
    fileprivate func add(_ viewController: UIViewController, at index: Int) {
        let containerView = ContainerView(parentController: self)
        containerView.install(viewController)
        containerView.setNeedsDisplay()
        containerView.setNeedsLayout()
        stackView.addArrangedSubview(containerView)
    }
    
}
